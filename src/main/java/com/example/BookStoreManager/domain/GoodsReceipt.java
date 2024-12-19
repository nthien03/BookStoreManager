package com.example.BookStoreManager.domain;

import java.sql.Timestamp;
import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "goodsreceipts")
public class GoodsReceipt {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String receiptCode;
    private Timestamp time;
    private Double unit_price;
    private Double totalPrice;
    private String note;
    private Boolean isDisabled;

    @ManyToOne
    @JoinColumn(name = "account_id")
    private Account account;

    @ManyToOne
    @JoinColumn(name = "supplier_id")
    private Supplier supplier;

    @OneToMany(mappedBy = "goodsReceipt")
    private List<GoodsReceiptDetail> goodsReceiptDetails;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getReceiptCode() {
        return receiptCode;
    }

    public void setReceiptCode(String receiptCode) {
        this.receiptCode = receiptCode;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public Double getUnit_price() {
        return unit_price;
    }

    public void setUnit_price(Double unit_price) {
        this.unit_price = unit_price;
    }

    public Double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public Boolean getIsDisabled() {
        return isDisabled;
    }

    public void setIsDisabled(Boolean isDisabled) {
        this.isDisabled = isDisabled;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public Supplier getSupplier() {
        return supplier;
    }

    public void setSupplier(Supplier supplier) {
        this.supplier = supplier;
    }

    public List<GoodsReceiptDetail> getGoodsReceiptDetails() {
        return goodsReceiptDetails;
    }

    public void setGoodsReceiptDetails(List<GoodsReceiptDetail> goodsReceiptDetails) {
        this.goodsReceiptDetails = goodsReceiptDetails;
    }

}
