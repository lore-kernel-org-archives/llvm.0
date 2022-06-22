Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83F51875
	for <llvm@lists.linux.dev>; Wed, 22 Jun 2022 19:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655925173;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zhjwqkPhJ9xw/9qovQS6fJqX4XywzD52eVaz4HaaZtQ=;
	b=IyDlSK5caWluxhX1Iqmer4g3X3vPDBm3bZx0FHfdj7D96LKJAhQx7fX+hbBx4OEIrwnBst
	ky3BkMB2qf8XO+rgt6AdFxJyw0Yz9+/XNHP+tsBUB5YaDj1SM+b9S5gU0D7Cp3MCrlD2Nj
	cltJPHPW2D/RSsl8mUkIrTuvP+0lv5I=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-640-I5LfeQTJMsm0ztR62TKlXw-1; Wed, 22 Jun 2022 15:12:52 -0400
X-MC-Unique: I5LfeQTJMsm0ztR62TKlXw-1
Received: by mail-qv1-f72.google.com with SMTP id s11-20020a0562140cab00b0046e7d2b24b3so17499878qvs.16
        for <llvm@lists.linux.dev>; Wed, 22 Jun 2022 12:12:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=zhjwqkPhJ9xw/9qovQS6fJqX4XywzD52eVaz4HaaZtQ=;
        b=7EtFvEoOM4uZlWqRyFw9RlcYpxj7Kha3qUxqrtFCjvtbKWxf4YVXR2oen5pgSzF70U
         t1Ht3aGq2KxZOGvGAZkuAbAFaIGRL0msGe7sAlXSm1TCJEv1tIKjoJu58oh3Altg2vFq
         ds9LWsFs7S1F+n/S0L1TNN+I+c4xEBw/XE3912PF2ZxU5gLlyaVzjM148IkpkC6252bR
         OGajlk47tdz27UkjWcsAhbDtCnKbWNt20adzax4bHytZXfObfqOMVUD0YtLWOvQNibGG
         YDIYr9oHvugPGT64iZepwPAxvINCthWdajdF1BJF8HVry/WVREuxF5D8H9zon8Q0W5zH
         eNNA==
X-Gm-Message-State: AJIora9eeLXyUR3jzqkx20two3EPD3Wp4pLqeEGQR/Bn1AWtunB4nBVc
	+DX4gexUUkxe/259eRvnmMJi79gjQgx41Q1aJo2v8rF8KJpAVJ1XceQ9r5Ac8cQlVFDJMQXBB2L
	oa7sG/sFw2nAmSg==
X-Received: by 2002:ac8:570b:0:b0:305:e83:af43 with SMTP id 11-20020ac8570b000000b003050e83af43mr4620305qtw.416.1655925171816;
        Wed, 22 Jun 2022 12:12:51 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u2yK6CJukE0PWUjhgIUO/v1rQGRwOO/j+saV7GVNjDPEvsJ8FGIj5m8+xhCHJwjmfYxEXiRg==
X-Received: by 2002:ac8:570b:0:b0:305:e83:af43 with SMTP id 11-20020ac8570b000000b003050e83af43mr4620282qtw.416.1655925171532;
        Wed, 22 Jun 2022 12:12:51 -0700 (PDT)
Received: from t14s.localdomain (c-73-69-212-193.hsd1.ma.comcast.net. [73.69.212.193])
        by smtp.gmail.com with ESMTPSA id bb33-20020a05622a1b2100b00304ea0a86cesm14906820qtb.81.2022.06.22.12.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jun 2022 12:12:50 -0700 (PDT)
Message-ID: <4a9629d0e8f14afbbb3c342c17c1633c9e882e9a.camel@redhat.com>
Subject: Re: Plumbers conf presentation on -fanalyze?
From: David Malcolm <dmalcolm@redhat.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: "Jose E. Marchesi" <jemarch@gnu.org>, clang-built-linux
	 <llvm@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>
Date: Wed, 22 Jun 2022 15:12:49 -0400
In-Reply-To: <CAKwvOdmJgU_MZjwuVXz5QvFdA4+eTHKqxT06HMAq=Hau03ar9Q@mail.gmail.com>
References: <CAKwvOdnb-DiAnq4bT7XiJpFtqyJYpWNw1shEp8gWYpVmUpRBaA@mail.gmail.com>
	 <8c5012c88989a8f05a3b67540b9172336c57ddf7.camel@redhat.com>
	 <CAKwvOdmJgU_MZjwuVXz5QvFdA4+eTHKqxT06HMAq=Hau03ar9Q@mail.gmail.com>
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
Content-Transfer-Encoding: 8bit

On Tue, 2022-06-21 at 15:06 -0700, Nick Desaulniers wrote:
> On Thu, Apr 14, 2022 at 3:08 PM David Malcolm <dmalcolm@redhat.com>
> wrote:
> > 
> > On Thu, 2022-04-14 at 14:42 -0700, Nick Desaulniers wrote:
> > > Hi David,
> > > Jose and I are currently in the planning process to put together
> > > a
> > > Kernel+Toolchain microconference track at Linux Plumbers
> > > Conference
> > > this year (Sept 12-14) in Dublin, Ireland.
> > > 
> > > We had seen
> > >  
> > > https://developers.redhat.com/articles/2022/04/12/state-static-analysis-gcc-12-compiler#scaling_up_the_analyzer
> > > particularly the section on The Linux kernel and were wondering
> > > if
> > > you'd be interested in presenting more information about -
> > > fanalyze to
> > > kernel and toolchain developers there?
> > 
> > Thanks!  I'm very much interested, but am not yet sure about travel
> > (both in terms of (a) budget and (b) possible new virus strains). 
> > Is
> > this conference going to be purely in-person, or hybrid virtual/in-
> > person?
> 
> Hi David,
> If you're still considering attending Linux Plumbers conf, please
> submit a proposal:
> https://lpc.events/event/16/abstracts/
> Please make sure to select "Toolchains Track" as the "Track" after
> clicking on "Submit new abstract."
> 

Hi Nick

Thanks, I've registered to attend, and have submitted this abstract:

  https://lpc.events/event/16/abstracts/1293/

("GCC's -fanalyzer and the Linux kernel" #177)

Hope the above looks good.

Dave


