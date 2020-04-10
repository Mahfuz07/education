package com.elearn.model;


import javax.persistence.*;


@Entity
public class Room {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "roomId", unique = true, nullable = false)
    private Integer roomId;

    @Column(name = "roomType", nullable = false)
    private String roomType;

    @Column(name = "description")
    @Lob
    private String description;

    @Column(name = "seatCapacity")
    private Integer seatCapacity;

    public Room() {
    }

    public Room(String roomType) {
        this.roomType = roomType;
    }

    public Room(String roomType, String description, Integer seatCapacity) {
        this.roomType = roomType;
        this.description = description;
        this.seatCapacity = seatCapacity;
    }

    public Integer getRoomId() {
        return roomId;
    }

    public void setRoomId(Integer roomId) {
        this.roomId = roomId;
    }

    public String getRoomType() {
        return roomType;
    }

    public void setRoomType(String roomType) {
        this.roomType = roomType;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getSeatCapacity() {
        return seatCapacity;
    }

    public void setSeatCapacity(Integer seatCapacity) {
        this.seatCapacity = seatCapacity;
    }
}
