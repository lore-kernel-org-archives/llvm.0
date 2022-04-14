Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0393225
	for <llvm@lists.linux.dev>; Thu, 14 Apr 2022 22:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649974087;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YFT4RHdEEKxbL6Pp86FmfbXwXPcHJ7kLGQ3GnlsoNWY=;
	b=IvhtRu7l3ScwYyP+X91vOo+HHAGHab/C79cYWdvYbKQnrnXPI1+cLvWdahodcm0CU0Z+sw
	gBQSOd03Rx8TEdczXM1k+igs3hJS6Dib2K06DtGyTQmFrOpwnddC+BN8yN3vRLJ4XSg9b3
	gs4TrVrCefvofSyuVbqQjBCcnmKalVs=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-611-F1SArbHKO6aZ9fjo8Sbjgw-1; Thu, 14 Apr 2022 18:08:05 -0400
X-MC-Unique: F1SArbHKO6aZ9fjo8Sbjgw-1
Received: by mail-qv1-f70.google.com with SMTP id jr12-20020a0562142a8c00b0044429017bcbso5508620qvb.20
        for <llvm@lists.linux.dev>; Thu, 14 Apr 2022 15:08:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=YFT4RHdEEKxbL6Pp86FmfbXwXPcHJ7kLGQ3GnlsoNWY=;
        b=EiIqiZhkT6a/mF1n0PmO6DoO7wy7/BiVI4rZThMKD0Z9PnPvtK5aGNBXqOIjLYN81b
         oPHnisnBoL0tMoRpNzYvJTz+EdzocSnPVZHKBXYibATQgxx3z+SH4qhh6vjKhk4wdtyk
         IkhzRHX21MvivknSpiarNW/1dLQZ3QY1DxSlkeR0WsCRRqMYurzK7uLOTlOTpcSd3r+6
         sBvMUziyz3WxMED8l2sBNIlC9aQacU8MAyVllC5+8pi0qr2mUsXtPzROt4B/o+tjPMhV
         xlSabN59bEuN9+0sIu6BMTYystkIgSuN0rlRWvJVnJd9lJ2r2kBuRBSuzdntG6PKVsS/
         rpHw==
X-Gm-Message-State: AOAM533uQnY1oipDnqZv1r7tLAUo3GG9TxZqSNMkEG7e0q7pRFWpom70
	He7PaTpIluas/mUMVGE0xr0p9qnlNEOQuRZwe2WKKb0CfViwiYfVZ4XBTZHkZWhachG+IzX0Kig
	RFkuAaIIvy6+Uig==
X-Received: by 2002:ac8:3d49:0:b0:2eb:cbf8:4140 with SMTP id u9-20020ac83d49000000b002ebcbf84140mr3396292qtf.279.1649974085424;
        Thu, 14 Apr 2022 15:08:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwNjD/LTcMvPIJiuDOC/j2dXELRBVtiEyiCbNKO8ii6DGHRCdlZjGYbBcoVixvERtyk40LsDQ==
X-Received: by 2002:ac8:3d49:0:b0:2eb:cbf8:4140 with SMTP id u9-20020ac83d49000000b002ebcbf84140mr3396276qtf.279.1649974085199;
        Thu, 14 Apr 2022 15:08:05 -0700 (PDT)
Received: from t14s.localdomain (c-73-69-212-193.hsd1.nh.comcast.net. [73.69.212.193])
        by smtp.gmail.com with ESMTPSA id s13-20020a05620a0bcd00b0067afe7dd3ffsm1606450qki.49.2022.04.14.15.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 15:08:04 -0700 (PDT)
Message-ID: <8c5012c88989a8f05a3b67540b9172336c57ddf7.camel@redhat.com>
Subject: Re: Plumbers conf presentation on -fanalyze?
From: David Malcolm <dmalcolm@redhat.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: "Jose E. Marchesi" <jemarch@gnu.org>, clang-built-linux
	 <llvm@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>
Date: Thu, 14 Apr 2022 18:08:03 -0400
In-Reply-To: <CAKwvOdnb-DiAnq4bT7XiJpFtqyJYpWNw1shEp8gWYpVmUpRBaA@mail.gmail.com>
References: <CAKwvOdnb-DiAnq4bT7XiJpFtqyJYpWNw1shEp8gWYpVmUpRBaA@mail.gmail.com>
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dmalcolm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2022-04-14 at 14:42 -0700, Nick Desaulniers wrote:
> Hi David,
> Jose and I are currently in the planning process to put together a
> Kernel+Toolchain microconference track at Linux Plumbers Conference
> this year (Sept 12-14) in Dublin, Ireland.
> 
> We had seen
> https://developers.redhat.com/articles/2022/04/12/state-static-analysis-gcc-12-compiler#scaling_up_the_analyzer
> particularly the section on The Linux kernel and were wondering if
> you'd be interested in presenting more information about -fanalyze to
> kernel and toolchain developers there?

Thanks!  I'm very much interested, but am not yet sure about travel
(both in terms of (a) budget and (b) possible new virus strains).  Is
this conference going to be purely in-person, or hybrid virtual/in-
person?

Dave

