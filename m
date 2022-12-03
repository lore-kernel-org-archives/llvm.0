Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BE779D0
	for <llvm@lists.linux.dev>; Sat,  3 Dec 2022 17:41:44 +0000 (UTC)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-1432a5f6468so8886764fac.12
        for <llvm@lists.linux.dev>; Sat, 03 Dec 2022 09:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BfYXengFDnfnOzmVghAMxVJe0q0bhZjcIwVtDVixuuc=;
        b=qkO1FGGFU/Tgle0WWvj8cXccebEqE76t1Re96EQ14f2BiHxJWrkXqoP6SCU9QcvhBx
         vZGnX6XiJFdZyMMbqeHm27I/cbr8XsiyJfeVpyVGbBNF+YzPMDJYvBMe4oPlBajwn4W7
         Og7JpOV119hh6f6HAERgTq58eF4CLkhBl5Q3lKGwj058bdN3pL8yRLOjOrpSqgnPbNdz
         Glg5VI4K4UxTx2m7bedNQ96kTVquQAigJKVVeExBTNgewhFJKVhuDK9vMFep4cIvtmK5
         FOjdMR/3f4zchSpjKY9VGDop1Jpg/3oY0hRitMj+dZJKC2Y4R2qQXk6L0BeV92N1dDUa
         KAHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BfYXengFDnfnOzmVghAMxVJe0q0bhZjcIwVtDVixuuc=;
        b=FxdLnOn8W1LNGxYkxiwhSDxg1nHcKrQQosHkuGYOmbGpd3Ooy/zPbW4mJW3YacK/K/
         41mfGrmynDOv4Ecb4s3NM5J2Lpi7qQCZ6qJxjSONaxInh6Rl2n9a6DRNXTVKd9d4mr0N
         O3IIx+MMT3sb6n36a53XzYItqgJUYtT31SN43qk08ID8ZeB+/fAyaDEXlO0UZjydn4Y4
         GHsz24vE3vkbeM9C0/GTS/gxObnxidXtAJqQIdZJFyoRBa1nOpBAZAOpEvkrCBbk0/iw
         qMbWCeCuwCw8MYNMLvsGA46qsncD9af8ITEFn4Wm27N1w7MmFzQxAhTkglnjDRUDKlFg
         A2qw==
X-Gm-Message-State: ANoB5pnFzJYDCAXYUTSSQ3Xq4A3orOBlpKXPwTx1dnbkOpGqjKfz5PVz
	X5CNLOjbv9P6lHfcMdIwC9zjzA==
X-Google-Smtp-Source: AA0mqf5NTOz+apWMFPKcQ9XNXEfFfCp/9DuksPQB/0T2wlJqAYXbypf5mVgq+AgXW5y/9tkbN4YfnA==
X-Received: by 2002:a05:6870:238f:b0:132:4782:72a8 with SMTP id e15-20020a056870238f00b00132478272a8mr36493950oap.136.1670089304057;
        Sat, 03 Dec 2022 09:41:44 -0800 (PST)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id f199-20020a4a58d0000000b004a084b7062asm3193064oob.40.2022.12.03.09.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Dec 2022 09:41:43 -0800 (PST)
Date: Sat, 3 Dec 2022 09:41:34 -0800 (PST)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
cc: Nathan Chancellor <nathan@kernel.org>, Sasha Levin <sashal@kernel.org>, 
    Hugh Dickins <hughd@google.com>, llvm@lists.linux.dev, 
    stable@vger.kernel.org
Subject: Re: [PATCH 5.4 and earlier only] mm: Fix '.data.once' orphan section
 warning
In-Reply-To: <Y4tQYgjDgodwR2pP@kroah.com>
Message-ID: <5f9317c7-e899-a6b2-dd23-664a1b6d629@google.com>
References: <20221128225345.9383-1-nathan@kernel.org> <Y4tQYgjDgodwR2pP@kroah.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 3 Dec 2022, Greg Kroah-Hartman wrote:
> On Mon, Nov 28, 2022 at 03:53:46PM -0700, Nathan Chancellor wrote:
> > 
> > As far as I can tell, this should be applied to 5.4 and earlier. It
> > should apply cleanly but let me know if not.
> 
> Queued up everywhere, thanks.

Thanks for queueing them up, Greg, but please read through the thread:
I have doubts on the 4.14 and 4.9 ones, which would want a different patch
if we're going to make any change; but thought we could just leave those
trees without the patch, and Nathan agreed.

Thanks,
Hugh
