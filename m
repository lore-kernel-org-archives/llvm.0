Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C36751CF4B
	for <llvm@lists.linux.dev>; Tue, 29 Sep 2026 17:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790701545; cv=none; b=mmd3cwgelzV0NfigCjtbBReRWL9B8UGjVWWeeUSHajHyEYWUwqgteX3pnqZZWxBG1+GtGsp1Q2uUlU5wu34GMV99Tcs2YSXRTq24rJm4iqhFnBMtJ1KrbLiQeOD2tT4hP3VNGp5WqvIS8HjC/pOBw0QkbtrRcRQO+n4DtHTA8qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790701545; c=relaxed/simple;
	bh=JV8h3XKKL4iKc1z0q0ZRCkZ4gT3Y6S4Dns2ilEa3XNY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VlwSKJX2zusWx1D518YkaGUAMkaf9pFcBWJCX2eBoSTn9NfSiO74jm+L2sOgPgjveSk3okLsYVnyjY6GVdY7EJm0rGWmJcO0uclqvYWJ9PkjEg6ZdBrO6sKxwM14O4atNlF0kSdLSDKKpTv6+Wmj8VYkcvGhuJFAUvZ1z0ZOjac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VKdzLDDj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VKdzLDDj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790701543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6J6pIvhEE+BADOBuoPnseFgbyAffm02tcOvxzUPEbqk=;
	b=VKdzLDDj2MHjWsBiEiq8z/7jeh2VziesCrbAQ6IxgCInnYIVI1JBQ0eZcD2O2I+b6lXkJQ
	aH72jra+bfvxPE7oa1CUTdo5bGwpjvXSsDxvZ/opYGBHs245IL1Z9g1IWXMVdHijJ74SQx
	Vx7A8fHz4KeBsdVX6q+C4yz5V5nNtoE=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-140-SXC0qrK8OGClfQvcxaLwrw-1; Tue, 29 Sep 2026 13:05:40 -0400
X-MC-Unique: SXC0qrK8OGClfQvcxaLwrw-1
X-Mimecast-MFC-AGG-ID: SXC0qrK8OGClfQvcxaLwrw_1790701540
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93c5e9c2ec1so206400785a.0
        for <llvm@lists.linux.dev>; Tue, 29 Sep 2026 10:05:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790701540; x=1791306340;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6J6pIvhEE+BADOBuoPnseFgbyAffm02tcOvxzUPEbqk=;
        b=F9T4JIAyHUC9mKHYzBtQnoM8etrhe+8olgAT5oqaCBFtgD8LCuZSf51zaR0IB/RrTA
         s28yvHd1B8hOyOgOqSUeOorYd343aK0kIvLFStSZMAJwHPT4eyURLI4I1PtnjBbVsgOR
         S5Lut7n/qOQqy7uATt9E0UC2LIQifAVwYxkJ9KNIl7qKprdW+6Bf4h0uucPaYK+NJ2UJ
         wlTMnzreg/rojHdemCPi+elUQsRPAx4mMVCF9+R/djCrHCv0yNoDMrzh4sDO9L9xayqv
         QSIBnjfJ/GD8/zu8sJboPL+pgCyVH0Htb2VnOZs5Se22wVRTxkVbrPzJ0+MvmcaEtUW8
         16qg==
X-Forwarded-Encrypted: i=1; AKwUvBxIR81YeYhQ2VQlTWzT0ZUyT/AFdAG39FXA2OtLCXNSvvzwCFwSztpgCryQuv6/DTZCLmrT@lists.linux.dev
X-Gm-Message-State: AFuF++k31YiQzyLYM91TXAIyBwUY9zWlJOF42aK+fEnXIoG3DHUuJZ7c
	ctH2RYl6tTgVBbjcKz7tacNJ7uYL8eVbnURrX713j8Nq0P/zhxY32HKYhX6AnKaW5AapNf0LtOx
	IqIUVofRgR/SqwCgPPtjb18RRbLyWLmb0hV6Au8VsfnNP63aRPWlm6ho=
X-Gm-Gg: AYBFou0HoIHlj9rRAw0UjarvlaQkRdgV9z9NgX5BYKXsk1dAMlZkh+j95vIpy4GBn6v
	HAZ+d6z509+XG1hSZ1WBRrUwOIFjhBHux42BoE4W5BfkZCnk2rjXkck2RL0nElp2006GPyxcEWY
	RFiCdYNxumNQArfUF+yS3fPO4yGw/78f0C/YHARO3s7t/5pUmlHn5xWnbBb/gFQIAw6W5ha/Jnq
	DGf9y5f2HcCwonzO4eBuCtiGMTmyqu/lc7v+mtCxOetQ1A0KqhFj5rkI1w1EERC48kTc/bHuhu9
	gWz8mRzVDqkq8dQByHlRGrYFkPi+00RoxlXYmQ95fOPZR8/fZkil42gyHTwHAnHtaTW3GKV3sDg
	1SxFzMZkvBDZ4zf+2+uC67B8Vp8Fsz+wutuWPhbYpqYi5+8zT71k=
X-Received: by 2002:a05:620a:6988:b0:939:7e23:b2f2 with SMTP id af79cd13be357-93c9fa5fc59mr25256585a.25.1790701540237;
        Tue, 29 Sep 2026 10:05:40 -0700 (PDT)
X-Received: by 2002:a05:620a:6988:b0:939:7e23:b2f2 with SMTP id af79cd13be357-93c9fa5fc59mr25248485a.25.1790701539617;
        Tue, 29 Sep 2026 10:05:39 -0700 (PDT)
Received: from bmasney-x1.rmtuswv.csb (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c9f541cfasm14451085a.38.2026.09.29.10.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 10:05:38 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: linux-clk@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 llvm@lists.linux.dev
In-Reply-To: <20260719214349.734351-1-rosenp@gmail.com>
References: <20260719214349.734351-1-rosenp@gmail.com>
Subject: Re: [PATCH] clk: mmp: allow COMPILE_TEST builds
Message-Id: <179070151857.199845.8103237122518687447.b4-ty@b4>
Date: Tue, 29 Sep 2026 13:05:18 -0400
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=273; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=oS1ZL6IKxW4hwmHG7GbpdJ7kavjzT5ERg1L4wiG0veU=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJ2v39wNLTMfKFGZMxiweX9O+933NBfv1/6+p+T/DNtz
 EW3HmRw6ShlYRDjYpAVU2RZkmtUEJG6yvbeHU0WmDmsTCBDGLg4BWAi220YGQ4tX3Py89/Ee1N+
 vs88PJ9ZKPPO+wfFNtIVaaacdV5vVpczMqw+96OJZcb/Txn7FTd4np/zIujURX8e388xaxe3XFl
 2fgY7AA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: K1Fro3pDpTniJaJ4qDgNIGCUAq8O6K2WTWYlUtJK0Go_1790701540
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit


On Sun, 19 Jul 2026 14:43:49 -0700, Rosen Penev wrote:
> clk: mmp: allow COMPILE_TEST builds

Applied, thanks!

[1/1] clk: mmp: allow COMPILE_TEST builds
      commit: d0b72c88671b3c46342bbebc9b90280890436c98

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

