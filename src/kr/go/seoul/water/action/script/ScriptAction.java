package kr.go.seoul.water.action.script;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import kr.go.seoul.water.action.BaseActionImp;
import kr.go.seoul.water.comm.WebConst;

public class ScriptAction extends BaseActionImp{

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 442833083318511224L;
	
	public static final int PrimeLen(String fmt)
	{
		int index;
		
		index = fmt.indexOf(".");
		if( index >= 0 ) {
			return (fmt.length() - index - 1);
		}
		
		return 0;
	}

	@Override
	public String execute() throws Exception {
		HttpServletResponse res = null;
		ServletOutputStream out = null;
		int nLoop;
		
		res = ServletActionContext.getResponse();
		if( res != null ) {
			out = res.getOutputStream();
		}
		
		if( out == null ) {
			return null;
		}
		
		res.setContentType("text/javascript");
		res.setHeader("Cache-Control", "no-store");
		
		out.println("//-----------------------------------------------------------------------------");
		out.println("// inner function");
		out.println("//-----------------------------------------------------------------------------");
		out.println("function _digitFormat(val, prime)");
		out.println("{");
		out.println("	val += '';");
		out.println("	x = val.split('.');");
		out.println("	x1 = x[0];");
		out.println("	if(prime > 0) {");
		out.println("		x2 = '.' + (x.length > 1 ? (x[1] + '0000000000').substr(0, prime) : ('0000000000').substr(0, prime));");
		out.println("	} else {");
		out.println("		x2 = '';");
		out.println("	}");
		out.println("	return x1 + x2;");
		out.println("}");
		out.println("");
		
		out.println("function _numberFormat(val, prime)");
		out.println("{");
		out.println("	val += '';");
		out.println("	x = val.split('.');");
		out.println("	x1 = x[0];");
		out.println("	if(prime > 0) {");
		out.println("		x2 = '.' + (x.length > 1 ? (x[1] + '0000000000').substr(0, prime) : ('0000000000').substr(0, prime));");
		out.println("	} else {");
		out.println("		x2 = '';");
		out.println("	}");
		out.println("	var rgx = /(\\d+)(\\d{3})/;");
		out.println("	while (rgx.test(x1)) {");
		out.println("		x1 = x1.replace(rgx, '$1' + ',' + '$2');");
		out.println("	}");
		out.println("	return x1 + x2;");
		out.println("}");
		out.println("");

		// 측정값의 점검중 여부
		out.println("//-----------------------------------------------------------------------------");
		out.println("// B1/B2 Check");
		out.println("//-----------------------------------------------------------------------------");
		out.println("function checkStandardValue(value)");
		out.println("{");
		out.println("	if( value == 'B1' || value == 'B2' ) {return false;}");
		out.println("	return true;");
		out.println("}");
		out.println("");
		
		out.println("//-----------------------------------------------------------------------------");
		out.println("// Min / Max Check");
		out.println("//-----------------------------------------------------------------------------");
		out.println("function checkStandardRange(id, value)");
		out.println("{");
		out.println("	if( value == '-' || value == '' ) {return true;}");
		for( nLoop = 0; nLoop < WebConst.SWQ_RANGE.length; nLoop ++) {
			out.println("	if(id.indexOf('" + WebConst.SWQ_RANGE[nLoop][0] + "') == 0) {");
			out.println("		return (" + WebConst.SWQ_RANGE[nLoop][1] + " <=  value && value <= " + WebConst.SWQ_RANGE[nLoop][2] + ");");
			out.println("	}");
		}
		out.println("	return false;");
		out.println("}");
		out.println("");
		
		out.println("//-----------------------------------------------------------------------------");
		out.println("// standard format");
		out.println("//-----------------------------------------------------------------------------");
		out.println("function getStandardFormat(id, val)");
		out.println("{");
		out.println("	id = id.split(' ').join('');");
		for( nLoop = 0; nLoop < WebConst.SWQ_FMT.length; nLoop ++) {
			out.println("	if(id.indexOf('" + WebConst.SWQ_FMT[nLoop][0] + "') == 0) { return _numberFormat(val, " + String.valueOf(ScriptAction.PrimeLen(WebConst.SWQ_FMT[nLoop][1])) + "); }");
		}
		out.println("	if(id.indexOf('CD') == 0 || id.indexOf('FTR') == 0 ) {");
		out.println("		return _numberFormat(val, 0);");
		out.println("	} else {");
		out.println("		return _numberFormat(val, 2);");
		out.println("	}");
		out.println("	return val;");
		out.println("}");
		out.println("");

		out.flush();
		
		return null;
	}
}
