Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287A147F41;
	Mon,  5 Feb 2024 17:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707155006; cv=none; b=H6mI08ZdbrnB1w76+9UE42MqtI2oIyDX2PFpYamUB58KcK4ECYCPYYMrF6ygYCyJ6HZFXgrCQDYiWdFcRXzwOPax3fJi8qEY74v9rwRo997EcsT3YpqOm4ks33sISQ+/frbcuvOntItLMiN4s0pajGN+zjtaPisOudfbwXJHNlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707155006; c=relaxed/simple;
	bh=FszDE/XZN8J7BOEYiSArlB+7WMmF3WrB4u6AKBLJb+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sotBFU6JDsuKUGhbX2KOHU9R2K4+nXUO942KaUuQsAXtE0H0TWz/L8iXIb9pG9Whn5gjRn1rctT0cWaJe9pZQ6sZQ1cDMtTO7Y303SZdX4CswVy3S25sokzyuYEmsf87kNMXlKvwtyHfFfofJ77gnTIucpCWuGrjEoy5Ddt2/y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eHrgjeks; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eHrgjeks"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-290ec261a61so2717758a91.0;
        Mon, 05 Feb 2024 09:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707155004; x=1707759804; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mgNIHjc69zdZAph9yMkp+/0YslGwEkyVKCEbZsWWPk4=;
        b=eHrgjeksok6UmVJoGIcnKOPabxPZKIpFIasdsUiq2rxM3bUekWeQ0ctrsGHxrCnDiE
         /i1XktxNsyLmLcHlTxzyoaV1Vhx1/E1vqra459f4aBRQ3cNQNj4fTVJ/UAowz48TjuTJ
         QZNihFD55Qy0bLjThhVEIq0Uph/zUkp76BD2EBDm3ECE+a2WkzAGJd1QOz7vNy04gqrX
         5ld3bSfwFPNiA5B3yh93WDfK0s4ETgLWOsgGzLY/2gxtletbyuPOc2qvOmbf/r/5Y3L1
         ZaX3sDij2RijHzovngn5eyjAoNKyWkr2Kh7wdL4jRARqGRD+tX71BquXvwPaqxN4kxTZ
         S2Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707155004; x=1707759804;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mgNIHjc69zdZAph9yMkp+/0YslGwEkyVKCEbZsWWPk4=;
        b=dVaKUkOLDr0sm+c0t/CA0ZJ0pQJKG1BxV53P9Dy0earHTgWr8u8mpofT2pnp90ugfC
         j5wCeau0NlfMpqSk50kkvBJgWvwQSXJLY+kG1ldi6KvCL8zICA77VQuHDBrzswa/zx/R
         aM/ILo5i2/egWNolvcZc+H47cvuHH4d0JV4c8iAhzFbbG8Kssmrmb8NfC2molBPnLJ7N
         SKJBx6yZgVlfSrWIoX33DL9d9y6J/XEPLziEEcBbZH0MkrSF97nf5xEpWnToX6DAUqO1
         EMEa9Oar0BLwhV0Of0sT2OoNDSxxjEwobFI4+j+vNjeO37QJxxYsp5GrUvJsovMreOrZ
         uTgg==
X-Gm-Message-State: AOJu0YzCoqIBXSFmSQTnbQDe9lQpMvLmrtuhY7V2vBPQkCn6gluqP9p5
	MyUV0io5OhsZ4wUhAlG29tmFrKW/q+ybxT4uMwW5Dbp5e8HACGCR
X-Google-Smtp-Source: AGHT+IFyb0EYprHtITKZSK4e2VzJ9Ogo54zvE5UcE4quXYvaGI+fqieoJ6VDFiXRj0n/2dxQXRmYTg==
X-Received: by 2002:a17:90b:4d87:b0:296:40c1:d7dc with SMTP id oj7-20020a17090b4d8700b0029640c1d7dcmr139762pjb.19.1707155004364;
        Mon, 05 Feb 2024 09:43:24 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWaNYsPkXJtJPkbY407ee+8T67K45VCRVQ83HQlCT1S+ToY18dAaiHlodZWQgsAa/2oEaXGITHio99BBmnHrEoORkQlyXpVwDN/NCFpPSYUUl+o3v9rU9i+cBCkY9ty7AAOb/S1Xs2TT+TB0jC45u0xUIICoRy1XqQhCuil9t/t1XU3+IOtxM55jg==
Received: from localhost (dhcp-141-239-144-21.hawaiiantel.net. [141.239.144.21])
        by smtp.gmail.com with ESMTPSA id q14-20020a17090ac10e00b00296aa266ffesm262137pjt.31.2024.02.05.09.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 09:43:24 -0800 (PST)
Sender: Tejun Heo <htejun@gmail.com>
Date: Mon, 5 Feb 2024 07:43:22 -1000
From: Tejun Heo <tj@kernel.org>
To: "Ricardo B. Marliere" <ricardo@marliere.net>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 3841/4021] kernel/workqueue.c:6798:32: error:
 passing 'const struct bus_type *' to parameter of type 'struct bus_type *'
 discards qualifiers
Message-ID: <ZcEeOueCbrltxr_b@slm.duckdns.org>
References: <202402051505.kM9Rr3CJ-lkp@intel.com>
 <i4yenyojsqdexpr6izup472nsva4badobnz6cyc7icqaahxj7q@bwzdilmscv3c>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <i4yenyojsqdexpr6izup472nsva4badobnz6cyc7icqaahxj7q@bwzdilmscv3c>

Hello, Ricardo.

On Mon, Feb 05, 2024 at 10:29:30AM -0300, Ricardo B. Marliere wrote:
> I'm not sure how to flag this as invalid, since this is fixed already in
> 32f78abe59c7 ("driver core: bus: constantify subsys_register() calls")

So, when there are cross-tree dependencies, it's best to note them when
sending out the patch so that the preparatory pulls can be made to avoid
breaking the applying trees. I just reverted the patch for now and think
it'd be best to route this patch through the driver-core tree. Can you
please repost the patch and ask Greg to apply it.

Thanks.

-- 
tejun
