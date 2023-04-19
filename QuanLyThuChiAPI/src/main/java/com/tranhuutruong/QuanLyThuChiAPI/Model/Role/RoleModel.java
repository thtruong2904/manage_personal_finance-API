package com.tranhuutruong.QuanLyThuChiAPI.Model.Role;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@Entity
@Table(name = "roles")
public class RoleModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "RoleName")
    private String name;

    public RoleModel() {
    }

    public RoleModel(Long id, String name) {
        this.id = id;
        this.name = name;
    }
}
