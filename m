Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CF43AD538
	for <llvm@lists.linux.dev>; Mon, 20 Jul 2026 20:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784577720; cv=none; b=CV8lK5fugBtnfPghH8ZwREmn5y32jb9ZSEHiZ09xc0se8ZH6NBVEatwbWzuK7usOxHHU8exO9k6usqPsAhwTOxfoI7DKffFzeNi5vndu6KkSusrFUXhWLn1S8ugtA5g7JI4oTa0DkcykmcAO322U+mDw0wbjXpHBBbEgcFCwgNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784577720; c=relaxed/simple;
	bh=dONdkvuIwys24Z+B6OeIAkVOC3faQ+xLgHXqKChycmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=cpoRPWIUa7uYbaZGYkJesVHip30DusTY4AxPgh8T6bIXWugt/Zx1BQLSzDoJYk5krbbN2f+jwCOMGNTGsVAbIIRTfZeUMKti51w9qOK2Ucta6jvgwTcKAoYL1x8F30NBi2tSE9tPN07vFAoZOk71ny3AfP1lO9ip4CbqVUYRYqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YJrUscfS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YJrUscfS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784577716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Wv9fvaxLH49NpPefXP+gfDcvYRMVVGve36jTQRR2YNo=;
	b=YJrUscfSAmSi/dwbiZ5Jpdtds8psCT0rKZVFGwktTg3tIqTcMg1EFE7Er2V2a/3TZHc+yK
	sVrpaCNqE8ov+ojcc/dXje+CMJY6birrQCDSnr+6iC4yTalN93bANxIiD/vTqJ0eSJ7VW8
	yh/4rsqzS/SDC28BXz+AQZuvLd9gwbw=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-182-h24o65SkO6SiqxhCl74kyQ-1; Mon, 20 Jul 2026 16:01:54 -0400
X-MC-Unique: h24o65SkO6SiqxhCl74kyQ-1
X-Mimecast-MFC-AGG-ID: h24o65SkO6SiqxhCl74kyQ_1784577714
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c083f1818so136171511cf.0
        for <llvm@lists.linux.dev>; Mon, 20 Jul 2026 13:01:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784577714; x=1785182514;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wv9fvaxLH49NpPefXP+gfDcvYRMVVGve36jTQRR2YNo=;
        b=f/hR1AAFX725UiJ9GX6AbW1gZDHcOwz/Pa/BTgXS50qB7mOTHWNwbt7vmJCalwN9qP
         QHxDagkTcWHiRdocMrN4Le7g+AF+tMs3Fs/7L3HGcF/11x21ceW0bye14Tr63KqoWJD7
         FxNFV/gQ7JVUQF7o8tmWdhAJyudT4zBkMaUuI3WplFDbTP/GWeNi96mUUqmNuK3vl5qP
         +yJ8aNu3xmgxfI8qUXbQ9R6HQc6mbFW5MQHu/9Y/ptnZ7Soh12dS1qGBniwtcXWwb09/
         b+ysJ1SBL58mmc+jqIZP8/TtxGfIgv/oEhCYjk84vcyTH4XFM17n5CiBBL69ouT8wsoV
         3rNw==
X-Forwarded-Encrypted: i=1; AHgh+RqDR06qvWQr58HR8VzBGelphSK1nrOMizBsncq/590JcYGGj8VP9Zbxx733AKgVEPy/Mn9x@lists.linux.dev
X-Gm-Message-State: AOJu0Ywgm1EftmWzhH2SW/EpEbbvcpSthxjM/FXywBmbU3JUYfhfNGby
	dAWE7AAcuOM5IPizBfLWBXVgTB9J8p2vehK/wDRh9Tn5Ch8E5YbnsImhz+pH0qQtt18ShqPBomH
	q0dPyWJjyRBDeWMkWlZts7Xf7wY0+RGkTkjqF0sIunZv1DcMok9SN57E=
X-Gm-Gg: AfdE7ck03IHk2C6mGM+2kb1aaGaGP5f3UUPVga8OEPfJpd1eM/E4T1BH1mzrSTExe9n
	5F69y8CvwgDeQWYF8M6jnfWJvTwoS9nuNOE5nO8I4L73qlyybSUMR/6qZZUU36gXMwMgw5m+xQ4
	SzEKuPKZ4hb3a5Sy2l+RVjMWoGpXRCOdUVOU9LthETtr2K7pfVi9zZ6khFGcGhjAF1cBXGmyvmT
	8i8LLu1uevv9PCw3q7/nvIAtsKb+w9sBHacgpJcCkVDoKZCCa5z6QKi+7f+IJm8NK79mSUg8zEq
	L01iFkJ0QQGjcK+Ufl9GIxJbTpEpruZUURRDO2q08hz3JTTRWNnyJL0i4aLHOENaxjYsdpKi6wr
	kVPuJkQbAYtxAbji8oQ6s+6S8jSF9pao9MDM=
X-Received: by 2002:ac8:5f93:0:b0:51b:f36d:1ae4 with SMTP id d75a77b69052e-5213cad91d7mr153345021cf.43.1784577713778;
        Mon, 20 Jul 2026 13:01:53 -0700 (PDT)
X-Received: by 2002:ac8:5f93:0:b0:51b:f36d:1ae4 with SMTP id d75a77b69052e-5213cad91d7mr153344631cf.43.1784577713349;
        Mon, 20 Jul 2026 13:01:53 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5214d095ed4sm79193511cf.10.2026.07.20.13.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 13:01:52 -0700 (PDT)
Date: Mon, 20 Jul 2026 16:01:49 -0400
From: Brian Masney <bmasney@redhat.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
	Nicolas Le Bayon <nicolas.le.bayon@foss.st.com>,
	Alok Tiwari <alok.a.tiwari@oracle.com>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>,
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Subject: Re: [PATCHv2 2/2] clk: stm32: allow STM32MP COMPILE_TEST builds
Message-ID: <al5-rbTqpaZ8EeHf@redhat.com>
References: <20260719215040.767232-1-rosenp@gmail.com>
 <20260719215040.767232-3-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260719215040.767232-3-rosenp@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ql213O6QlDxvILbD7E5zCCThoY6D3DOkRCw2joekCUQ_1784577714
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jul 19, 2026 at 02:50:40PM -0700, Rosen Penev wrote:
> COMMON_CLK_STM32MP already allows COMPILE_TEST, but the parent clock
> Makefile only descends into drivers/clk/stm32 for ARCH_STM32.  Use the
> STM32MP clock symbol for that directory gate instead.
> 
> Tested with:
> make LLVM=1 ARCH=loongarch drivers/clk/stm32/
> 
> Assisted-by: Codex:GPT-5.5
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

