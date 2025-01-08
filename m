Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F79919AD5C
	for <llvm@lists.linux.dev>; Wed,  8 Jan 2025 02:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736305201; cv=none; b=Y/AISJeTU+uA2VGSz/3+zfElFJWrQ36cCZzHKk152zwYPcXeuFSixAbi8ChpFsbEeDOmv8as3bLuZfYwWjmjAObCW1OrESbHJZ+RqSubM9I47EXjubpZG6kVd6E0X3aJ1DUDP6pCm/WYmm8YYJKn19csFT9n6Mst/HbZWVWnR0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736305201; c=relaxed/simple;
	bh=x66hmIGILhwKaBIsLRM+S0y66E+k9BuE/weApjH/UBI=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=TAklSb4hN2CUn9a653YTtVfev/JWyQTRWfJr6xyYMRGmfPe3FSgovfczYIepjV2NPk0Yk8zk+Nko0G+iyJQbWSMy0pFr9dgKG8RHjWvHdG9nF1V08yY9EIXghr7YXiXXAh2IIWerbbvkufj5JvqBDvspgms5eQ9NXU/wnSSmBmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=MwpkhASA; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="MwpkhASA"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-467b955e288so157629361cf.1
        for <llvm@lists.linux.dev>; Tue, 07 Jan 2025 18:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1736305199; x=1736909999; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nTMN0fZnjdwbZaPCb5FrQLxLApwEte1/54lx0D/jILQ=;
        b=MwpkhASA7ayLvj5H4sPAAH0WoyxD55aIjBaVWlD3FsMB4xP/kzJL4DXQfyzIBSUxfK
         wfoq5t/8WRJbS1cfCjGR0E0PNahKFAvCy2/TwxOlxyRKCzWez79nvjHdvXFG3b24CW5L
         gnplLbfz5xE/tvY724o59NabGrApslpt579McDyibJnCGHLOKDjp6yv9JZnhqN5M3EZO
         hyZl9I27XoqvLm86vxFBnRYKDW3NRfU9EKz7SglwqTAee5VpPhrgDkAjHs5Jssox2Xz3
         fmSs6WP2vToS6gul2HMYb9ti8KmMAYteT9VRaowMbBCbn/AZMwppcKrtv+azPFIp5tkC
         PATQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736305199; x=1736909999;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nTMN0fZnjdwbZaPCb5FrQLxLApwEte1/54lx0D/jILQ=;
        b=Kk/0jL5cKZUQXIlTop1X0JnPQlNpLKpJTzGAR5PsfTvMW+SIqfu4h2ERsHJGwldY8D
         LuvYMKke96hotZ2kjqtpHeiuse+96uEbsuKstsi7MyadQPeUlhsV30Lo6cthgoYUBwoV
         cUwm9WoIKh3aUpPf2I9sjMfqkaEN4+TekSSX/wRUVTqwoO32s1rg/FKHOktgiGbOKYvH
         TYE/1n4/7fD5kApJ7q/41AxSbQI52zy8dbKp6sdMJVKF5SGbsGGvTlfBoyXwT8t4qevD
         OMeHGE+hb3wWifxWy33d5/lFl2OXh+XLcHp5KBfhiaLh7OZtsImMFdHDU9AvOgi+EZC/
         m+Vg==
X-Forwarded-Encrypted: i=1; AJvYcCXWdd92AiGZEDnkM6is9YFXpZd6zrmiKVc7lYZ7rV3tdEZglTEFrWrR3TFjDxv+OjtbF5WR@lists.linux.dev
X-Gm-Message-State: AOJu0YzdfPkm/G6kfApz6qhGe2AJAOMGW0aiM5HpoGyWn47DH8Ry/T4t
	xkvZticPCeAEDY7UKlcLYzjZYtgRSSFTuEiRJjIMP1QBfr4OEous0h6PM9JG0A==
X-Gm-Gg: ASbGncvCsh6hOTJEQPC83wSEeeqzcMnSFmOxkbD23JF+/pPuKmJ6VeuQL0oysdilESF
	xvnPlCBQ5/YsngeAmqDxyQohvyGchexsjDz/zWTIunIzHeBx6DIOLuwmocjxJxhlRTs4zohUMB+
	W3SN7UMohk0G6w66LVrtlggUMjW0ydeLbo9zP+7gU184ksI01G63ptcpkq/W0uLMnYFb005YY7X
	4/sjci6qpB4l6xZjlRM+6JvpXhgu5XCNSRM2fr7/EXieaGQUdA=
X-Google-Smtp-Source: AGHT+IEk9o+lqCx9JhOO2ZsHFc/qXlWJ0wAp87lFv1hIl4E+FwexInYRHy3Gb8LgewH65wTTxnEBVA==
X-Received: by 2002:a05:622a:6082:b0:46c:726a:178c with SMTP id d75a77b69052e-46c726a18d8mr10961201cf.11.1736305199031;
        Tue, 07 Jan 2025 18:59:59 -0800 (PST)
Received: from localhost ([70.22.175.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46a3e6892ddsm191617051cf.29.2025.01.07.18.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 18:59:58 -0800 (PST)
Date: Tue, 07 Jan 2025 21:59:58 -0500
Message-ID: <0a1328b83f79fab79ded9e333240c6bd@paul-moore.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20250107_1610/pstg-lib:20250107_1603/pstg-pwork:20250107_1610
From: Paul Moore <paul@paul-moore.com>
To: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgoettsche@seltendoof.de>, selinux@vger.kernel.org
Cc: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, =?UTF-8?q?Thi=C3=A9baud=20Weksteen?= <tweek@google.com>, =?UTF-8?q?Bram=20Bonn=C3=A9?= <brambonne@google.com>, Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, Casey Schaufler <casey@schaufler-ca.com>, Canfeng Guo <guocanfeng@uniontech.com>, John Johansen <john.johansen@canonical.com>, GUO Zihua <guozihua@huawei.com>
Subject: Re: [PATCH RFC v2 4/22] selinux: rework match_ipv6_addrmask()
References: <20241216164055.96267-4-cgoettsche@seltendoof.de>
In-Reply-To: <20241216164055.96267-4-cgoettsche@seltendoof.de>

On Dec 16, 2024 =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgoettsche@seltendoof.de> wrote:
> 
> Constify parameters, add size hints, and simplify control flow.
> 
> According to godbolt the same assembly is generated.
> 
> Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
> ---
>  security/selinux/ss/services.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)

Merged into selinux/dev, thanks.

--
paul-moore.com
