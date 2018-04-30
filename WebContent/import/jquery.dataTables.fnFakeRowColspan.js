$.fn.dataTableExt.oApi.fnFakeRowColspan = function ( oSettings ) {

    /* Fail silently on missing/errorenous parameter data. */    
    
    var _oSettings = oSettings;  
    oSettings.aoDrawCallback.push({ "fn": fakeRowColspan, "sName": "fnFakeRowColspan" });
    
    function _checkSpan(aData) {
    	var bRet = false;
    	
    	// COLSPAN �� ROWSPAN ���� Ȯ��
    	jQuery.each(aData, function(i, oRowData) {
    		jQuery.each(oRowData.nTr.childNodes, function(j, oCellData) {    			
    			if( oCellData.colSpan > 1 || oCellData.rowSpan > 1 ) {
    				bRet = true;
    				return;
    			} 
    		});
    	});
    	
    	return bRet;
    }
    
    function _calcSpan(aData) {
    	var firstOccurance;
    	var iRowCnt, iColCnt;
    	var iRowLoop, iColLoop;
    	var spanCnt;
    	var oCellData;
    	
    	// colspan ó��    	
    	jQuery.each(aData, function(i, oRowData) {
    		firstOccurance = null;
    		spanCnt = 1;

    		jQuery.each(oRowData.nTr.childNodes, function(j, oCellData) {    			
				if( oCellData.innerHTML == "#colspan" ) {
    				spanCnt ++;
    				if( firstOccurance != null ) {
    					firstOccurance.colSpan = spanCnt;
    				}
    			} else {    				
    				if( firstOccurance != null && spanCnt > 1 ) {
    					firstOccurance.colSpan = spanCnt;
    					spanCnt = 1;
    				}
    				firstOccurance = oCellData;
    			}
    		});
    	});
    	
    	// rowspan ó��
    	iRowCnt = aData.length;
    	if( iRowCnt > 0 ) {
    		iColCnt = aData[0].nTr.childNodes.length;
        	for( iColLoop = 0; iColLoop < iColCnt; iColLoop ++) {
        		firstOccurance = null;
        		spanCnt = 1;
        		
        		for( iRowLoop = 0; iRowLoop < iRowCnt; iRowLoop ++ ) {
        			oCellData = aData[iRowLoop].nTr.childNodes[iColLoop];

					if( oCellData.innerHTML != "#colspan" ) {
	    				if( oCellData.innerHTML == "#rowspan" ) {
	        				spanCnt ++;
	        				if( firstOccurance != null ) {
	        					firstOccurance.rowSpan = spanCnt;
	        				}
	        			} else {    				
	        				spanCnt = 1;
	        				firstOccurance = oCellData;
	        			}
	    			} else {
	    				spanCnt = 1;
	    				firstOccurance = oCellData;
	    			}
        			
        		}
        	}
    	}
    }
    
    function _removeSpan(aData) {
    	if( aData == undefined || aData == null ) {
    		return;
    	}
    	
    	var iCellLen, iPos;
    	var oCell;
    	
    	// span ������ ����    	
    	jQuery.each(aData, function(i, oRowData) {
    		iCellLen = oRowData.nTr.childNodes.length;
    		iPos = 0;
    		
    		while( iPos < iCellLen ) {
    			oCell = oRowData.nTr.childNodes[iPos];
    			
    			if( oCell.innerHTML == "#rowspan" || oCell.innerHTML == "#colspan" ) {
    				oRowData.nTr.removeChild(oCell);
    				iCellLen --;
    			} else {
    				iPos ++;
    			}
    		}
    	});
    }
  
    function fakeRowColspan () {
    	//console.log("_checkSpan");
    	//if( _checkSpan(_oSettings.aoHeader) ) return this;
    	if( _checkSpan(_oSettings.aoData) ) return this;
    	//if( _checkSpan(_oSettings.aoFooter) ) return this;
    	
    	//console.log("_calcSpan");
    	//_calcSpan(_oSettings.aoHeader);
    	_calcSpan(_oSettings.aoData);
    	//_calcSpan(_oSettings.aoFooter);
    	
    	//console.log("_removeSpan");
    	//_removeSpan(_oSettings.aoHeader);
    	_removeSpan(_oSettings.aoData);
    	//_removeSpan(_oSettings.aoFooter);
    	
    	//console.log("_complete");
    	
    	return this;
    }   
    
    return this;
};