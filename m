Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB1B432BC9
	for <llvm@lists.linux.dev>; Mon, 20 Jul 2026 14:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784559218; cv=none; b=PKZuqOO6k+jOfENh6eHu9+rZ44NSmaRcSK4yu50eu2vg6NHyVygjs4C40yt0Ic2dKl4QcM7sqVrRvCAPPOpj9+m1LwQM16yCUeSYP58FdF62s6ZQ/uslAmPIXINFUR8VI/gOaIYzznRfUPBPIowQjJbIN5EyuQMw+/0K8Vaw71c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784559218; c=relaxed/simple;
	bh=iLYRWaNk/L+zEf51Fw1AJnt56OpG7F/Gckhy92hAdCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=KjlQcZyu/O6rzBnNh0DPhi0zWjhyDA46mnz9bCQI6hREcAry904mrDVqHyAVVsbFNlboRPD5huNUV770m0KyHh2VmAFBQVUxmcoyk7qfIi8UqftqwwWhvf9VCsx91IxDG+Gl6fhwT87yd65cBD5mfpaUbHx0RxYFdcfXMvZ5z9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iaiFDunb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iaiFDunb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784559215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=evDvOiGDhmVXHHfwqNhuM4pd8+K7f8icKN4u95tqZg0=;
	b=iaiFDunbyt3GSb6cANT9kx03Yv9tczCFSxK+/DRlDbv4U//6HWcnl3l7mdQYpb0OA6/jU6
	QVPctIY7BuFnsc4wpV2EKHyU6UIxMdZP8KEXNjWM7gY3zRMrtkzg1DD/LHRftFEBXFe156
	a1lsqEi+ARPqwAElFbAAnl3fPQRYn4s=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-203-iceiHxd3NValq7tlcs69Lg-1; Mon, 20 Jul 2026 10:53:32 -0400
X-MC-Unique: iceiHxd3NValq7tlcs69Lg-1
X-Mimecast-MFC-AGG-ID: iceiHxd3NValq7tlcs69Lg_1784559212
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ee593a5a2fso102796356d6.1
        for <llvm@lists.linux.dev>; Mon, 20 Jul 2026 07:53:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784559212; x=1785164012;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=evDvOiGDhmVXHHfwqNhuM4pd8+K7f8icKN4u95tqZg0=;
        b=C5UKXrK704A+5ixdoif4NY0/ojGra5YUp+RBeWTkOZMqRuv2NpAH/FF14m/QrMlvTy
         TZ9kC1fQn119IXLdYHCi39L8znV0okf7hxMbw5L8sFNziPjy9pPK/Bqlfzgiwxm1uidF
         +RAtkb/ZNOlWpvaXufaj/17fvuxGKp0Vr9zWvMhbCNKwpOFtlCpedgTgFnrje9Z5gz1B
         a+8uewushIoY87lNhaYuMQ6S+jCKsYiTaX3bAxTd7iRJj6BbWnU5qXfyU1Q/rob/N4W7
         Y6oLICT1sxaHG+NzHxmE0mDlgAKSwOkB4kfbqlIgaFo8/7xq799Z24bDJiLqmIR0hkSz
         ksaw==
X-Forwarded-Encrypted: i=1; AHgh+RqUBaMITk3oLgorPPVLG1uFVTMf46cqm+DdS6Ov1yC0uZg6kOl14b+J7dhZ7B1JseX2Qhdg@lists.linux.dev
X-Gm-Message-State: AOJu0YyqrVx3v+EKLindFoPAD8Mn34nHkVVTcM57TsOAJYadh/xRXbd+
	NYLaoK4msURNxzYv8fnEgtrM3EraphiJhxVISejl/m0OsKLHOIvrIL9E004SkFlCXqaUlwXag4Q
	AcIk2Bd47IVXX7cao/mT11rdIoeD3oeo1X/BOfbeQkXd/NmOVo6NkWe0=
X-Gm-Gg: AR+sD13SUNqKcxXDRpZPa3hwZULAYpS2dlbutGEyzbBrEwUZQjt1T3NXv3+tKhfLt/A
	j4OPjEY2On4thdE517QnxzYPlWX+toggK4Ke5q9ZHk68kRLH0ALSiGx1RRP7ivBlNt6dXIGdUAL
	jRjyzqD25vy3GjcPg+ZA6RttOzFnOaFpU9Fg0XQWhVnI/FfK1I/jzUmRfcLxuolUt2yJk+pilQP
	sD6v2PF8MvOxcr8/0bU8DO/nj8hyqYQnOc65OmtzBOWYXLsb28HjRrTL7kfih5VDIXhqb/ltRUb
	ihCTQhXh/75Y3624EEM1XJuKn/fbooa8DLQgrEXxCmy+iJyrI0azwoSKZGovAQQprxrsVQWbQZ+
	rzQwjJWfndP+YCtO1QrWQfGhX2Rq6bBVYmjM=
X-Received: by 2002:a05:6214:411d:b0:8fd:b96d:195b with SMTP id 6a1803df08f44-90768e13aefmr201311146d6.15.1784559211685;
        Mon, 20 Jul 2026 07:53:31 -0700 (PDT)
X-Received: by 2002:a05:6214:411d:b0:8fd:b96d:195b with SMTP id 6a1803df08f44-90768e13aefmr201310706d6.15.1784559211220;
        Mon, 20 Jul 2026 07:53:31 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907786ed2e2sm91787956d6.33.2026.07.20.07.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 07:53:30 -0700 (PDT)
Date: Mon, 20 Jul 2026 10:53:28 -0400
From: Brian Masney <bmasney@redhat.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Subject: Re: [PATCH] clk: hisilicon: allow COMPILE_TEST builds
Message-ID: <al42aFXfvbPUIJAV@redhat.com>
References: <20260509051110.1061393-1-rosenp@gmail.com>
 <agHu78VflprAM7Yj@redhat.com>
 <CAKxU2N9Wf07ZNvVyOz=WR+8TdzxoivnAp5x3_FN5rqpU6M7maw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAKxU2N9Wf07ZNvVyOz=WR+8TdzxoivnAp5x3_FN5rqpU6M7maw@mail.gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OnY9wcPtnbqDiPCsACC_xugqlQetJ-weWO3yA7odS_Q_1784559212
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Rosen,

On Sun, Jul 19, 2026 at 02:44:03PM -0700, Rosen Penev wrote:
> On Mon, May 11, 2026 at 8:00 AM Brian Masney <bmasney@redhat.com> wrote:
> >
> > On Fri, May 08, 2026 at 10:11:10PM -0700, Rosen Penev wrote:
> > > The HiSilicon clock symbols already depend on ARCH_HISI or COMPILE_TEST,
> > > but the parent clock Makefile only descends into the hisilicon directory
> > > when ARCH_HISI is enabled.
> > >
> > > Add a hidden family gate selected by the HiSilicon clock and reset symbols,
> > > default it for ARCH_HISI, and use it for the parent Makefile descent.  This
> > > keeps existing platform builds unchanged while allowing compile-test
> > > coverage.
> > >
> > > Tested with:
> > > make LLVM=1 ARCH=loongarch drivers/clk/hisilicon/
> > >
> > > Assisted-by: Codex:GPT-5.5
> > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> >
> > Reviewed-by: Brian Masney <bmasney@redhat.com>
> Should I resend?

Yes, it missed the last merge window, and I submitted it to Stephen on
June 29th via this git pull:

https://lore.kernel.org/linux-clk/akLzCVzbMbUsgDda@redhat.com/T/#u

Let's see what he says. Hopefully you won't have to resend.

Brian

