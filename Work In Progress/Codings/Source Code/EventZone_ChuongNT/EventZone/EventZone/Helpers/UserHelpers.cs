﻿using System.Web;
using EventZone.Models;

namespace EventZone.Helpers
{
    public class UserHelpers
    {
        private const string User = "user";

        public static User GetCurrentUser(HttpSessionStateBase session)
        {
            var userSession = session[User];

            if (userSession == null || userSession.ToString().Length == 0)
            {
                return null;
            }
            var user = (User) userSession;

            return user;
        }

        public static void SetCurrentUser(HttpSessionStateBase session, User user)
        {
            session[User] = user;
        }
    }
}