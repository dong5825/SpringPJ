package model;

import org.jsoup.nodes.Element;

public class Weather {
	private String amdes;
	private Element amimg;
	private String amtemp;
	private String amrain;
	private String pmdes;
	private Element pmimg;
	private String pmtemp;
	private String pmrain;
	
	
	
	
	public String getAmdes() {
		return amdes;
	}




	public void setAmdes(String amdes) {
		this.amdes = amdes;
	}




	public Element getAmimg() {
		return amimg;
	}




	public void setAmimg(Element amimg) {
		this.amimg = amimg;
	}




	public String getAmtemp() {
		return amtemp;
	}




	public void setAmtemp(String amtemp) {
		this.amtemp = amtemp;
	}




	public String getAmrain() {
		return amrain;
	}




	public void setAmrain(String amrain) {
		this.amrain = amrain;
	}




	public String getPmdes() {
		return pmdes;
	}




	public void setPmdes(String pmdes) {
		this.pmdes = pmdes;
	}




	public Element getPmimg() {
		return pmimg;
	}




	public void setPmimg(Element pmimg) {
		this.pmimg = pmimg;
	}




	public String getPmtemp() {
		return pmtemp;
	}




	public void setPmtemp(String pmtemp) {
		this.pmtemp = pmtemp;
	}




	public String getPmrain() {
		return pmrain;
	}




	public void setPmrain(String pmrain) {
		this.pmrain = pmrain;
	}




	@Override
	public String toString() {
		return "Weather [amdes=" + amdes + ", amimg=" + amimg + ", amtemp=" + amtemp + ", amrain=" + amrain + ", pmdes="
				+ pmdes + ", pmimg=" + pmimg + ", pmtemp=" + pmtemp + ", pmrain=" + pmrain + "]";
	}
	
	
}
