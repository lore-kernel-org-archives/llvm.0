Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF23BD51A;
	Tue,  6 Feb 2024 17:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707241672; cv=none; b=RIZPzGq6VBE547r2cteJGVyEHyL/pygKhHdgeqgZCSaycz/3yL0fip19NiRjA6VXDRXzfO0mAryq1unSLro8WU1GTSppynqmbL89SSLZP+ImoVebc18OufY80OdRI3qABfW3pwm5pVZfCHnbMAo60wu4BSHU98FFZ9xBXLmrc6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707241672; c=relaxed/simple;
	bh=M0lBJxkvrEfuVzWG05vQTssQmuCUrVHIs6obrZpqmfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QXChnG/UxGIiB85h7UXw1AI2oERM5EW42cQG8JIK9fXK79wR36yYroOjbckC3sV7ahSfemX1p/0h92Kgc6lar9LVU13WNFYjf+BO5SrnbkEt279wOrGuOLPBtbOjTS+xUjzPGsmR0OPjYnOKDvaSXHotwNjCvM1tH6Uxd68BC5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=marliere.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b=XevbqmtS; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=marliere.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b="XevbqmtS"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1d9b2400910so6170525ad.0;
        Tue, 06 Feb 2024 09:47:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707241670; x=1707846470;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:dkim-signature:date:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oueQHPVYh7qQOIvfrJui5MM2vsTeWpl0FzYgCGvX8ZA=;
        b=Ebv1+em1rEQ7NhqwLhG2wCFiDe5DEHUxzJtb4ehnUpFvczvmSyF/MfOnDcf8yWFETf
         hm9G9WncJ8c0UZS/rO8Ujh9UOmRhcKE1HCw3upO/a/K7rt0aDfoIgUI9UBUftU+98bGM
         uavZYv0VISstK+wIkr1nQhfi13dW3lwJSSvpAhwMuyM1ZBg4iPWcE3osVjmXGPlIYR1S
         Ph/P741F/D6IjiNrl0skVzL+WPqQuwjK+yuxDdh67Uk0OSF118lv3QGSmE13CVQc8CEd
         AOQeJ31EzT0eJ71xqkVCbzCiVLDZQMroy/qmPLynFqFNoSQwd8VuIlCtpO80KJlDDbtu
         qzmA==
X-Gm-Message-State: AOJu0Yz6A00fSpe2gBFohD9X024tjM4mFbXYnFj/VXLgeS1ZXlzpJb46
	1eR1n2tycWBmQwBiAlXoKYnHYaS6O3vRlq2+Zo0qyUq3dTvVCf8D
X-Google-Smtp-Source: AGHT+IF1A1mqqVSjUX9NkYIbLBVRd5kF8THuXekHU8vUUhJa30v3ZtXBi3N1cl0smSwQO3w0Se6L4Q==
X-Received: by 2002:a17:902:64d6:b0:1d9:df9a:722f with SMTP id y22-20020a17090264d600b001d9df9a722fmr2118401pli.17.1707241669995;
        Tue, 06 Feb 2024 09:47:49 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCV1h+OClmF163UbZUE3cCMIFHg1rbK8MV1BOrCXen5eGslxENHHQrwLoJ8n2jlDCSXXc4TStsHDWwKe5zlNBA9D5zPR62j741r2X1WNDmEFRab6id9Nk7u3r2PbCVTqAq/rUaKxnzDES0BA/7Pe6AkBWBOAF2I8vQ==
Received: from mail.marliere.net ([24.199.118.162])
        by smtp.gmail.com with ESMTPSA id x8-20020a170902b40800b001d9b0a15bbfsm2125244plr.262.2024.02.06.09.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 09:47:49 -0800 (PST)
Date: Tue, 6 Feb 2024 14:48:19 -0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=2024; t=1707241667;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oueQHPVYh7qQOIvfrJui5MM2vsTeWpl0FzYgCGvX8ZA=;
	b=XevbqmtSQpYqQK1b8QpQ94Ze2tVzBWwo51BIACXqhIS4f370i9JyUD0KqcDC3tX0Zwa8Vt
	2zwf++cAhr8UM/dATCkyqjJXCNVaJxlFoq2PifGmqEDAs1pDRoVav4iHiqdMu1/AmvxIEF
	TnvaySpAS+YKrEH9jvfpcXA0y9vuw3GdF+sighneTWvwfYymhAe4ntv74+0LNXhnk9OhoS
	X7FRLZhQ+MHJsU/Kic3QQcNK9Cnb3MKufTlmO2XIcTB4DH6sJtMM83IGofHpVBvZvn6PpR
	dDYiUYkq5vFfn06qaFd+2fOtqfVaXmHPgfcYSbBma6i11piERvV3yyNwujU4fw==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
From: "Ricardo B. Marliere" <ricardo@marliere.net>
To: Tejun Heo <tj@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 3841/4021] kernel/workqueue.c:6798:32: error:
 passing 'const struct bus_type *' to parameter of type 'struct bus_type *'
 discards qualifiers
Message-ID: <wkj256gqj4ghtpfjiy57pbmtx7jfntv7vhfbeckbyk6fwzmpmb@6me7whi7slah>
References: <202402051505.kM9Rr3CJ-lkp@intel.com>
 <i4yenyojsqdexpr6izup472nsva4badobnz6cyc7icqaahxj7q@bwzdilmscv3c>
 <ZcEeOueCbrltxr_b@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZcEeOueCbrltxr_b@slm.duckdns.org>

Hi Tejun,

On  5 Feb 07:43, Tejun Heo wrote:
> Hello, Ricardo.
> 
> On Mon, Feb 05, 2024 at 10:29:30AM -0300, Ricardo B. Marliere wrote:
> > I'm not sure how to flag this as invalid, since this is fixed already in
> > 32f78abe59c7 ("driver core: bus: constantify subsys_register() calls")
> 
> So, when there are cross-tree dependencies, it's best to note them when
> sending out the patch so that the preparatory pulls can be made to avoid
> breaking the applying trees. I just reverted the patch for now and think
> it'd be best to route this patch through the driver-core tree. Can you
> please repost the patch and ask Greg to apply it.

Sorry for that, I'll resend to Greg then.

Thank you,
-	Ricardo.



> 
> Thanks.
> 
> -- 
> tejun
