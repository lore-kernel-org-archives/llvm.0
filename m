Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931AD1FAC31;
	Mon, 21 Oct 2024 18:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729536932; cv=none; b=dSc7wwjutsQLtjTAiVl34k7JXpBY6FBib+Ll99PwDL1qADQiA9AY4tnCVaYzl0tEmRZsiqW+rCF5TTIBWuk4Ktk7Csa4MAWl1yAaBgqDGQovjDOV6eo7FNGMgWXqKUIpVldNWcsXy32eSyVu0xBhERTAyRsZ1OHrtNyt9hALa+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729536932; c=relaxed/simple;
	bh=Q3A6VgxaB4dw7rhYJLtvJiYvu5N3mxUYxM9U6khpanY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L8/BoBnkNUw6jjOyufWsHIZr2OtbETL9hiAVQc+yJ8LOtOXTtL0dN9M1f/ZFA+aal3c+h9jJK2V+HBbG5GUj0gx2GinlRywmhQ9UYxWyoqA1gyp1ZUQeZtfgJD+ey58QVTSMJuG2hXWM8Smolhp1S6RYC5ec2XzchY3s3uTR9Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=marliere.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b=NOIikpRA; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=marliere.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b="NOIikpRA"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-20c693b68f5so51368145ad.1;
        Mon, 21 Oct 2024 11:55:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729536928; x=1730141728;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:dkim-signature:date:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QrxUrL4dSeFni3k7G6DaoYVjPB2O9ReZU6YDPolAUcc=;
        b=h0cJP3a253UGosdvPsUOZGn/SmbipzqRgGl+ySNRHuSimMNHoB3NBvSu/ZhLRsVGk0
         pjE/n56vVJ3ap7OKmtF4uj4axszs1kvuHxaDAftKXYHH7joISWyXph/yXLV5JalaPPHq
         PmOIJS7ogoN4YtcH8wJefD9WgzAVLoGFuFVzmNOMBYJpwij8+OD2DlOZmNR8GiAZxyQV
         +0oOk9/OM1d72nBEUlhYMIBqFSTrIsdqF6wKQvAB+8lpnyFIFXJttPSKPk5hgNfYKAPE
         spi5DGqUH/SIYKNa/t38HCuff1k1/x1ekn+kQjunfyhD7Trp1VIndlRnTQ9bmzFaLF0s
         TJVQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5ZFk29/9ys4ICDiPz17mDqAhqmP9KG1mlKk48PZoEKdyAATk9TSKxWfl2cTuF3R6UUM3XAS2L3LfvCojl@lists.linux.dev
X-Gm-Message-State: AOJu0YzqmHxLBS/vsSV6XUip2jHOsKqimmBYWvnFzwgInHygJBz9DLZN
	0eC7eNOiax/HQsUhQHiYCRKxn3a0LNeuri4To6f7wBXZ0lsLjiEf
X-Google-Smtp-Source: AGHT+IF6W/+BQ/XwrpcK7PAKbkunM8P1Dmgzd00YNGD5G5h1SHUgwgyI1xRcBFxGtD4zPNL9qj6BfA==
X-Received: by 2002:a17:903:1ce:b0:20b:7be8:8eb9 with SMTP id d9443c01a7336-20e985b3abcmr1485065ad.54.1729536927610;
        Mon, 21 Oct 2024 11:55:27 -0700 (PDT)
Received: from mail.marliere.net ([2604:a880:4:1d0::7f5:6000])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0f58eesm29112575ad.283.2024.10.21.11.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 11:55:26 -0700 (PDT)
Date: Mon, 21 Oct 2024 15:55:15 -0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=2024; t=1729536923;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QrxUrL4dSeFni3k7G6DaoYVjPB2O9ReZU6YDPolAUcc=;
	b=NOIikpRAZLdAcboX+bfNJb2unH5zDe8eoR5tZwZJQSEGvOoqcsQi8GAeXBodnTY8fBmDo0
	sy7Uv/6xssQodx5GN/epVBPEZtu1CKmCZenK+C8wvGDboRMQOqoOn0n3PDZ0w7hK5ZJ/x7
	v+FdyUbFgXNjgFNtrrV5JIk5TvkqNj1hpYbIO56KJmUiUZdEU0SoPrb6eiOLmiywYxvir3
	eEQOJz1DgDkn4NfZhU5U1JwUdeHnYjUGKPaBBK+8eKxTDoYF6inHCj5LyVgnHxJ4sk8nxV
	c+A89DmrryMvrDrAVT8DfHd966wYt45Q8UXhqPOA3RWOieVQsbhmxirGHuuuWw==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
From: "Ricardo B. Marliere" <ricardo@marliere.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	devel@driverdev.osuosl.org
Subject: Re: [driver-core:const_work 31/40]
 drivers/bus/fsl-mc/fsl-mc-bus.c:409:5: error: initializing 'struct
 device_type *' with an expression of type 'typeof (fsl_mc_bus_dprc_type) *'
 (aka 'const struct device_type *') discards qualifiers
 <gregkh@linuxfoundation.org>Greg Kroah-Hartman
Message-ID: <gynt2dgjjxsj5rxgzffs4omfopgmgleumgpjub6vmybpxz5rzu@vwpi7jnimguo>
References: <202410220209.WYSCnfNH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202410220209.WYSCnfNH-lkp@intel.com>

Hi Greg,

Please consider applying:
https://lore.kernel.org/all/20240904-class_cleanup-fsl-mc-bus-v2-1-83fa25cbdc68@suse.com/

Instead of:
https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git/commit/?h=const_work&id=cfd1974cbf0023d6d6de9e410aa1860d5a34c132

Thank you,
-	Ricardo.


