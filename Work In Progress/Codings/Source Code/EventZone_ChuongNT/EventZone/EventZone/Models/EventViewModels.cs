﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace EventZone.Models
{
    public class CreateEventModel
    {
        [Required]
        [StringLength(100, ErrorMessage = "The {0} must more than {2} characters.", MinimumLength = 5)]
        [Display(Name = "Title")]
        public string Title { get; set; }

        [Required]
        [Display(Name = "Start Time")]
        public DateTime StartTime { get; set; }

        [Required]
        [Display(Name = "End Time")]
        public DateTime EndTime { get; set; }

        [Required]
        [Display(Name = "Location")]
        public string LocationName { get; set; }

        public string Longitude { get; set; }
        public string Quality { get; set; }
        public string PrivacyYoutube { get; set; }
        public string Lattitude { get; set; }

        [Required]
        [Display(Name = "Privacy")]
        public int Privacy { get; set; }

        [Required]
        [Display(Name = "Streaming")]
        public bool IsLive { get; set; }

        [Required]
        [Display(Name = "Category")]
        public long CategoryID { get; set; }

        public bool RequestUrgent { get; set; }
        public string Description { get; set; }
    }

    public class ViewThumbEventModel
    {
        public long eventId { get; set; }
        public string avatar { get; set; }
        public long numberView { get; set; }
        public string eventName { get; set; }
        public DateTime? StartTime { get; set; }
        public DateTime? EndTime { get; set; }
        public List<Location> location { get; set; }
    }

    public class ViewDetailEventModel
    {
        public long eventId { get; set; }
        public string eventAvatar { get; set; }
        public string eventName { get; set; }
        public int NumberLike { get; set; }
        public int NumberDisLike { get; set; }
        public LikeDislike FindLike { get; set; }
        public int NumberFowllower { get; set; }
        public string eventDescription { get; set; }
        public bool isFollowing { get; set; }
        public bool isOwningEvent { get; set; }
        public DateTime? StartTime { get; set; }
        public DateTime? EndTime { get; set; }
        public List<Location> eventLocation { get; set; }
        public List<Image> eventImage { get; set; }
        public List<Video> eventVideo { get; set; }
        public List<Comment> eventComment { get; set; }
        public int Privacy { get; set; }
    }
}