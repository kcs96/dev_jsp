package com.map;

import java.awt.BorderLayout;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

public class RestaurantView extends JFrame implements ActionListener{
	//선언부
	JPanel jp_north = new JPanel();
		JButton jbtn_ins = new JButton("입력");
		JButton jbtn_upd = new JButton("수정");
		JButton jbtn_del = new JButton("삭제");
		JButton jbtn_sel = new JButton("조회");
	
	JPanel jp_center = new JPanel();
		String cols[] = {"식당이름","주소","전화번호"};
		String datas[][] = new String[0][3];
		DefaultTableModel dtm_res = new DefaultTableModel(datas,cols);
		JTable jtb_res = new JTable(dtm_res);
		JScrollPane jsp_res = new JScrollPane(jtb_res);//스크롤바를 제공하는 속지-JPanel동급
	//생성자
	public RestaurantView() {
		initDisplay();
	}
	//화면처리부
	public void initDisplay() {
		jbtn_ins.addActionListener(this);
		jbtn_upd.addActionListener(this);
		jbtn_del.addActionListener(this);
		jbtn_sel.addActionListener(this);
		jp_north.setLayout(new FlowLayout(FlowLayout.LEFT));
		jp_north.add(jbtn_ins);
		jp_north.add(jbtn_upd);
		jp_north.add(jbtn_del);
		jp_north.add(jbtn_sel);
		jp_center.setLayout(new BorderLayout());
		jp_center.add("Center",jsp_res);
		this.add("North",jp_north);
		this.add("Center",jp_center);
		this.setTitle("골목식당 정보Ver1.0");
		this.setSize(800,550);
		this.setVisible(true);
	}
	//메인메소드
	public static void main(String[] args) {
		new RestaurantView();
	}
	@Override
	public void actionPerformed(ActionEvent e) {
		Object obj = e.getSource();
		
		if(obj.equals(jbtn_ins)) {
			System.out.println("입력 버튼 호출 성공");
			RestINSView riv = new RestINSView();
		}
		else if (obj == jbtn_upd) {
			
		}
		
	}

}
