Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70865A7B4
	for <llvm@lists.linux.dev>; Mon, 25 Mar 2024 15:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711380988; cv=none; b=QiSklKZHV42LM+RKQcsa43rElN9q//R0Knz4PW7jbck1HdG/jWfVwyqPD9OxRqVnw19Ofaay4Dg7fCZU1T1aoA9ZCH/JyoKFnJid9/DXChNNcO4mhdd0vdaK7yYIIblG3GAztJqXYqDhQy9YbODw68ZbfuV+sZsguGQ5u8qltrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711380988; c=relaxed/simple;
	bh=kX8SJsy7Wu9qxWsB/EuNbqjpIU+HpoK55f1JMPu/7D4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LDOtRy0RK5kcoy65lALSocoCYxDsa9kWkkNo6tyGDOKeOMtiHZXPyMHAfI+ejmcMof2L8EFSXzyfwTZVjwcWYjosSWoj3yoSQ9opCqUZWmjFAGRmwmXN59IcUfumRL8jmvWZ4pAzlPcQ4n4novULQJM5yn1s4toHLFcWQt0LJUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BBsnp1XU; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BBsnp1XU"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-565c6cf4819so9245837a12.1
        for <llvm@lists.linux.dev>; Mon, 25 Mar 2024 08:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711380985; x=1711985785; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JYD9V/lEsf9uqiYf4EWxgIYLkJpRooIT1PnEwEiySfg=;
        b=BBsnp1XUdWz0RRtN9zvTP2XCLlXLWrIFCAUUDPrNEm3wpVBr5V6aHMdxwVSEPdz9GU
         tOW7uVWykllfmSkeMXS8MbgOGz2RC7ssRvsJ6cXpM1ErTGjWWqdHUHYcVjRKjfwLVsTw
         SBaEISxKZP9EZHz1dUch7VM30IrJrZq3pZFYK3GHYPhCC6cikDTDM6XH8PCaGM10+FaQ
         as+ULT9mH1Wt1xyKZtTfdEZuWGI3qAT+W/t2wr58UkDzxdX/zIw4OxuYIAItKdB+j/H8
         8xSRYJe+ofspZ8sU7njmyyaRB7QqEKVM9Q9xsyLKOCbCkwbVrWiGclPSkSzuqv3AIDss
         yn+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711380985; x=1711985785;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JYD9V/lEsf9uqiYf4EWxgIYLkJpRooIT1PnEwEiySfg=;
        b=JkDBOS9Izkv2VMxMjZ3WLffQ724mPdYAyUXWSzgllomfTAiC9bWypF+zwBoV2hEztX
         afQPyJm0gTna4eNJn5gaky72MZlTdOrOnTAqIE53kMuQgVJjjgow6IVD5qAULfAICapz
         bLFRdKJYHNoXWFfHXOV/Pc47XQfkTWuqUhkckkrag8865AdKRR/ERlXwXj8E8DPGhkm/
         96v+X0pVYmaE9unkyxh9DU8pqTK4ostNDXu4l4PY0VUW7z45ZnilDiz/Xp+obNg51mu2
         wME5dhgJcDjjJ4Py5AkrWoUaYmslMtjs8VmYVFX1m9s/1cBXKLIoHDtLNX4tHMbDmyV7
         T+OA==
X-Forwarded-Encrypted: i=1; AJvYcCXIB//K2gnnOrWZYrEkUcSBKGI/HHyysC5kPUhaEL0xiC3dsr7+2uVX2PwpBywssevqUfWQaTL3DLYbyM1X9Un6jOQ0iA==
X-Gm-Message-State: AOJu0YwOgyuXuDp6IuSReKofDvjoFr0yQ1rpkrxrvQbBf9dt+FZZ9LyT
	1GzEcLu+RuyJV8Ur5Wnh518AEHHmp50RuQwdZHRQ7TIHe7NcMI9Kh5VtN8mo6Lc=
X-Google-Smtp-Source: AGHT+IF2L6kelCSMu/YRNMu9WaK4KKCHqMviE11VEijc/cs+BMMniJENJTygPUjr5tPFrc3qxoCONg==
X-Received: by 2002:a17:906:69c2:b0:a47:3cd5:b3f1 with SMTP id g2-20020a17090669c200b00a473cd5b3f1mr5421382ejs.35.1711380984859;
        Mon, 25 Mar 2024 08:36:24 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id z3-20020a170906668300b00a4750a4a1f7sm1999823ejo.6.2024.03.25.08.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 08:36:24 -0700 (PDT)
Date: Mon, 25 Mar 2024 18:36:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Subbaraya Sundeep Bhatta <sbhatta@marvell.com>
Cc: Su Hui <suhui@nfschina.com>,
	Sunil Kovvuri Goutham <sgoutham@marvell.com>,
	Geethasowjanya Akula <gakula@marvell.com>,
	Hariprasad Kelam <hkelam@marvell.com>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"nathan@kernel.org" <nathan@kernel.org>,
	"ndesaulniers@google.com" <ndesaulniers@google.com>,
	"morbo@google.com" <morbo@google.com>,
	"justinstitt@google.com" <justinstitt@google.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	"kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: Re: [EXTERNAL] [PATCH 2/2] octeontx2-pf: remove unused variables
 req_hdr and rsp_hdr
Message-ID: <21c3a484-68a1-43a0-ac48-e9a85027605c@moroto.mountain>
References: <20240325073549.823832-1-suhui@nfschina.com>
 <20240325073549.823832-2-suhui@nfschina.com>
 <CO1PR18MB466675E232FA99415D766F68A1362@CO1PR18MB4666.namprd18.prod.outlook.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CO1PR18MB466675E232FA99415D766F68A1362@CO1PR18MB4666.namprd18.prod.outlook.com>

On Mon, Mar 25, 2024 at 12:44:44PM +0000, Subbaraya Sundeep Bhatta wrote:
> Hi,
> 
> >-----Original Message-----
> >From: Su Hui <suhui@nfschina.com>
> >Sent: Monday, March 25, 2024 1:06 PM
> >To: Sunil Kovvuri Goutham <sgoutham@marvell.com>; Geethasowjanya Akula
> ><gakula@marvell.com>; Subbaraya Sundeep Bhatta <sbhatta@marvell.com>;
> >Hariprasad Kelam <hkelam@marvell.com>; davem@davemloft.net;
> >edumazet@google.com; kuba@kernel.org; pabeni@redhat.com;
> >nathan@kernel.org; ndesaulniers@google.com; morbo@google.com;
> >justinstitt@google.com
> >Cc: Su Hui <suhui@nfschina.com>; netdev@vger.kernel.org; linux-
> >kernel@vger.kernel.org; llvm@lists.linux.dev; kernel-janitors@vger.kernel.org
> >Subject: [PATCH 2/2] octeontx2-pf: remove unused variables
> >req_hdr and rsp_hdr
> >
> >Clang static checker(scan-buid):
> >drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c:503:2: warning:
> >Value stored to 'rsp_hdr' is never read [deadcode.DeadStores]
> >
> Consider this also as a fix and add Fixes tag. Also please add "net" in subject to
> easily identify whether this patch as net or net-next material.
> 

It's not a bug fix so it doesn't need a Fixes tag.

regards,
dan carpenter

