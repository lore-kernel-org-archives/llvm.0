Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E738E195F3A
	for <llvm@lists.linux.dev>; Fri,  9 Aug 2024 15:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723216280; cv=none; b=h7y+nwie0eYA2qfZpVEbmA7vSIxVwKRsPQarG7r0HHeGPqEjftJfwbCnt4TsM948MwgdEi+3fB4yugUB2vwjEXFPzFJsAKDjOl0HocXUsHvG73o1S0YFgGdtz2tJGUvstWoxCvEtYd1qgQgNJBMZbT2NKFa0qiqUp+pPyRTVLA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723216280; c=relaxed/simple;
	bh=7qv5/5ztgjnBd8ABlrZklhWeB1+KbwrFTx+b/38oBVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uear8aVE6Of6xuZfCTQ1f61fdW9YdjXqPBqDrZg+0abzkUyl8k10EicsLrxi5NYXqojSKeiMTnlH8BMjew0iYLu8OFBhxkuPQnXRoqCmLSoCVXWmjbVk3efPt3+ErcKh/SIMkyUOxyqfq4dpYGFRgcAzv9zLu0qfhx7WvaWhUyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JJGCSpgt; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JJGCSpgt"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5a10bb7bcd0so2756215a12.3
        for <llvm@lists.linux.dev>; Fri, 09 Aug 2024 08:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723216276; x=1723821076; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HCnFjP8yeSTbgg04jO70aNmUrU3V0BlhkT72Qsh0eiU=;
        b=JJGCSpgtZ6MbHHFdUYzjHhIxI2eqz8RQiGsByQ4eisZNYQ5QIjugiORMr0/xjo/SJe
         6skCWqfcmhrqSSPUmgxNAR+6dSiWD7KoJ7uCzUlJ3+Ui0MyQwkU4IGI+V1XAf+hCz+64
         5BIyLO1x76kyI8pDq5iwlnGqqk7Ohah7M03nF0RtID77xbz40A5Ikp6CqGaMI+zWS07B
         dEIbkUEwqdJDCqYouV4BQf62PshOoXHWhISFnTP0L5H8yZ/j9+01RNpo18QycZ+yIq7P
         3TPF1zpct1Uqj/qngMRturIh49UsODhAoZf8NcYWmC9hTuuOE3pp30Vkf2BbOPMhN0Ap
         Isiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723216276; x=1723821076;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HCnFjP8yeSTbgg04jO70aNmUrU3V0BlhkT72Qsh0eiU=;
        b=IVN9kHduvnNP0Li83WSBwfLGHCLmRq4jz2Xfe7W/xX1PekeyBJ9XHZJ5qbH4PjFqKe
         zQcmg0RQzozH+ojcQg02gI8p3V/tlOgcWM0s50Yx4NpoJOJx+roDQli1Kl4VMbXXDBCt
         FicxYbM5x6yh2q9WuFfeq6XZh2z3+L+PRWYfsPSBXOraSgf+xhAS3rot9YNFBTs259YX
         ZT6benVpTnX1zMgTfu+4/D4UuelXe+C4L3FLkOXCQNVVm617Xu4I+sGZyYR2u+SRcTQT
         0np/YzrCp8Dct6ggAk03UpjBMDimceT2QJW46Q0fK+TmwK/UZRzREiLxX+RRH9ArM9nk
         u5/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXm+xXs64QR/DLE+LEqXumvgqK3IRSfdoGnPQIugfWy2dnoNDkQrkRJT5H7G1PZm8V4vwgleukB4GA9bRwgUkHSLF+f9g==
X-Gm-Message-State: AOJu0Yxhm/c6rgMM9Zr+zwIRCUrvhEFdZJxYG7IY015K7Y3+N5mxjoB3
	YJlF+DaP1rM/wPrRdx5K5P1e/KVIRVsDI7JBAQBzCFWoc3+p7EXR6Q9AfvoDgd4=
X-Google-Smtp-Source: AGHT+IHM6/NyJG0fypeFEFHE1MSoC6qNiWwYqrml/FzF4jdvuVfqudW3tenaS4EdJbwoBirlwLdtnA==
X-Received: by 2002:a05:6402:348b:b0:5a2:4d19:4c08 with SMTP id 4fb4d7f45d1cf-5bd0a58a137mr1382401a12.11.1723216275896;
        Fri, 09 Aug 2024 08:11:15 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bbb2c1dbe4sm1590031a12.27.2024.08.09.08.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 08:11:15 -0700 (PDT)
Date: Fri, 9 Aug 2024 18:11:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Su Hui <suhui@nfschina.com>, David Howells <dhowells@redhat.com>
Cc: sfrench@samba.org, pc@manguebit.com, ronniesahlberg@gmail.com,
	sprasad@microsoft.com, tom@talpey.com, bharathsm@microsoft.com,
	nathan@kernel.org, ndesaulniers@google.com, morbo@google.com,
	justinstitt@google.com, linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] smb/client: avoid possible NULL dereference in
 cifs_free_subrequest()
Message-ID: <a08c6b03-6d23-4711-a891-14b0250b90be@stanley.mountain>
References: <20240808122331.342473-1-suhui@nfschina.com>
 <893f2ebb-2979-4e34-bdab-a7cbb0c7e7b8@stanley.mountain>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <893f2ebb-2979-4e34-bdab-a7cbb0c7e7b8@stanley.mountain>

On Fri, Aug 09, 2024 at 06:00:26PM +0300, Dan Carpenter wrote:
> On Thu, Aug 08, 2024 at 08:23:32PM +0800, Su Hui wrote:
> > Clang static checker (scan-build) warning:
> > 	cifsglob.h:line 890, column 3
> > 	Access to field 'ops' results in a dereference of a null pointer.
> > 
> > Commit 519be989717c ("cifs: Add a tracepoint to track credits involved in
> > R/W requests") adds a check for 'rdata->server', and let clang throw this
> > warning about NULL dereference.
> > 
> > When 'rdata->credits.value != 0 && rdata->server == NULL' happens,
> > add_credits_and_wake_if() will call rdata->server->ops->add_credits().
> > This will cause NULL dereference problem. Add a check for 'rdata->server'
> > to avoid NULL dereference.
> > 
> > Signed-off-by: Su Hui <suhui@nfschina.com>
> 
> Needs a Fixes tag.
> 
> Also when you add a Fixes tag, then get_maintainer will add the David Howells
> automatically.  I've added him manually.
> 

Actually, David should have been CC'd but the fixes tag wouldn't have pointed
to his patch.

This is an inconsistent NULL checking warning.  It's not clear to me if the NULL
checks should be removed or more added.  If David were trying to fix a NULL
pointer dereference and accidentally left one unchecked dereference out then the
Fixes tag would point to his patch.  Since David was doing something unrelated
then we don't point to his patch.  Instead it would point to the first patch to
introduce the dereference.

regards,
dan carpenter

