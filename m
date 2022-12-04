Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9213C28
	for <llvm@lists.linux.dev>; Sun,  4 Dec 2022 15:56:03 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id d8so3303483qki.13
        for <llvm@lists.linux.dev>; Sun, 04 Dec 2022 07:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ymxb9P0IjaxkkgKVbX6h7FxkgCqELgbUOIk2uateazM=;
        b=cVlmRloO4KNhNRrJ63bRjLA13sTnnbulFLVFURZ33x90IiP0Kt4zYLx7438l15k6Il
         T1sFgex4nd3dgVNBGFDg3wphlvnA8nSsBmSd/rakfg+Sdt5newA6wcvknuPi39QPnkCR
         /4UCaZCbwnFEuC50dJvo7AAquprObV6SAFbIy/tb6UWrhN1BUhbfFyJbaUvUMqE/x7oR
         mbLeIopRbc6asTNB5CW2B8CSykyKkCvAH5imkoz/KR/p2NFSaq5p2PXHdoPaG0vvkeMO
         0ZAerAr5K49Fij96V7b/ct8wzZGegscRki/+jtQFpJlVN30rLOvL/3LJ7ugctn3pkhq0
         sddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ymxb9P0IjaxkkgKVbX6h7FxkgCqELgbUOIk2uateazM=;
        b=7ye3zsyO0YURhsDWxkwZJBJXr0LHnAYuC4h3RX+dPJJpieAf6JUPdclXP5P+iRy1qw
         u1kj5NFxpyWkPiwsEerqXLeivQY7StD0HWTnHAnJpy8FwgLor2n2cYb3tNW/ZcoAs1wH
         CVP1lqxj5ZGVsYfkeF1VawMq5VNy3lCjYcAbSF4EeUeNBLioAXN/1uybjvkiia0setYq
         RPmAmUTQYllha9tfQ3L9N1YwRC3CiDBSiaJq71a50+Nu+TOLFaOpZ1R4zqsimHh8+NQI
         E9O/1KeESKyCbn5TFhdvKkSrC53xfeUJhVsprB6jwp7fUUbLZcjBJcEyQwCfjGNFUox5
         v5sw==
X-Gm-Message-State: ANoB5pm/erLBSYK1v09v661qVrG1usQ5UqlEinaJxfLQ++BNwhZUqFmX
	6mI9hUGetLpZrEo6S4Sio3KR7A==
X-Google-Smtp-Source: AA0mqf6gCQUk4Zkn69FtuBXcBs5H3jj6g8nCuhuHwMPCyK6VBX7d9hPjDPz8CKyc3kK8wBUIASjdNw==
X-Received: by 2002:a05:620a:31a9:b0:6fb:c632:f915 with SMTP id bi41-20020a05620a31a900b006fbc632f915mr55217860qkb.492.1670169362509;
        Sun, 04 Dec 2022 07:56:02 -0800 (PST)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id az15-20020a05620a170f00b006ce1bfbd603sm10117567qkb.124.2022.12.04.07.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Dec 2022 07:56:01 -0800 (PST)
Date: Sun, 4 Dec 2022 07:55:51 -0800 (PST)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
cc: Hugh Dickins <hughd@google.com>, Nathan Chancellor <nathan@kernel.org>, 
    Sasha Levin <sashal@kernel.org>, llvm@lists.linux.dev, 
    stable@vger.kernel.org
Subject: Re: [PATCH 5.4 and earlier only] mm: Fix '.data.once' orphan section
 warning
In-Reply-To: <Y4y/AEsLmKRcQ/R0@kroah.com>
Message-ID: <e43dc462-9eca-e1f8-2fb8-7d5ebd2342ae@google.com>
References: <20221128225345.9383-1-nathan@kernel.org> <Y4tQYgjDgodwR2pP@kroah.com> <5f9317c7-e899-a6b2-dd23-664a1b6d629@google.com> <Y4y/AEsLmKRcQ/R0@kroah.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 4 Dec 2022, Greg Kroah-Hartman wrote:
> On Sat, Dec 03, 2022 at 09:41:34AM -0800, Hugh Dickins wrote:
> > On Sat, 3 Dec 2022, Greg Kroah-Hartman wrote:
> > > On Mon, Nov 28, 2022 at 03:53:46PM -0700, Nathan Chancellor wrote:
> > > > 
> > > > As far as I can tell, this should be applied to 5.4 and earlier. It
> > > > should apply cleanly but let me know if not.
> > > 
> > > Queued up everywhere, thanks.
> > 
> > Thanks for queueing them up, Greg, but please read through the thread:
> > I have doubts on the 4.14 and 4.9 ones, which would want a different patch
> > if we're going to make any change; but thought we could just leave those
> > trees without the patch, and Nathan agreed.
> 
> Oops, sorry, now dropped from 4.14 and 4.9 and I left the 4.19 one as
> that one was ok to keep, right?

That's right, the 5.4 and the 4.19 ones are straightforward.
It was just the 4.14 and 4.9 ones which were questionable (because
of other related infrastructure missing), so better dropped.

Thanks,
Hugh
