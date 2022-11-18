package com.Infinite.inventoryproject;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

public class WalletDAO {

	SessionFactory sessionFactory;
	
	public List<Wallet> searchWallet(String cId){
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		Criteria cr=session.createCriteria(Wallet.class);
		cr.add(Restrictions.eq("customerId", cId));
		Projection projection=Projections.property("walletType");
		 cr.setProjection(projection);
		List<Wallet> walletList=cr.list();
		return walletList;
	}
	public String GenerateWalletid() {	
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		Criteria cr = session.createCriteria(Wallet.class);
		List<Wallet> walletlist = cr.list();
		session.close();
		if( walletlist.size()==0) {
			return "W001";
	
		}
		else {
			String id = walletlist.get(walletlist.size()-1).getWalletId();
			int id1 = Integer.parseInt(id.substring(1));
			id1++;
			String id2 = String.format("W%03d", id1);
     		return id2;		
		}	
		
	}
	public String addWallet(Wallet wallet) {
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		String walletId=GenerateWalletid();
		wallet.setWalletId(walletId);
		org.hibernate.Transaction tran =  session.beginTransaction();
		session.save(wallet);
		tran.commit();
		return "Payment details Added";
	}
	public List<Wallet> ShowWallet() {
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		Criteria cr = session.createCriteria(Wallet.class);
		List<Wallet> walletList = cr.list();
		return walletList;
		
	}
}