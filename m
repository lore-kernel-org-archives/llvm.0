Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F866FC0E
	for <llvm@lists.linux.dev>; Sun,  2 Mar 2025 12:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740918908; cv=none; b=UV0krrxXdCMmos+vzsrkNtNSBcBpiFhjHQTlAU5rovPWQ2wcrUf2FZmKK7+oRXaPQHS5gasGdo/+An/ktp7oYeoLY9VW9Pk1+DFinLv7kieFRb20zQq3rn0XTw99GCoQ6IoPg7MpFON3Tg+Qq6550R7nPgQ46r4gdJ3yC/Lv9ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740918908; c=relaxed/simple;
	bh=WVV53O4G4AQkDwByqkbjtuuQX8Evj7GgwGkRnE+c62k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YiPlzvm7U/HLEIP3SjnCeIwYtJDNQyUtPQktog9xkiaUhX7SbwJuwf4HvT631/6reXzelwOZvqnBFinIVvRME/1cpmgP1Pp2xlf9NAMOt9odxlFhev1o2BnQ7H5r1rmxoQgo0pK7kaFL8nksq0wJ4rBeWJixsXcmzk9ZkoWTRUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=On8zcWcJ; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="On8zcWcJ"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ab771575040so839496566b.1
        for <llvm@lists.linux.dev>; Sun, 02 Mar 2025 04:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740918905; x=1741523705; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TSlBNjxFdfPRWaRfE5Fsi1hiMnyGQ/3j+AOhQpdfvzA=;
        b=On8zcWcJPa5VN/KwPysSs3z+OfGtbJ/kXFrVHxH0M4c8UGhmTGdGjfOo91xEo9QUuE
         gUiXhzW6PMgr/UoVtA7MzFiIsd0aCzJfoquUPCL6dpLjltw1LW2JfCe2wAb9SZC6Byf6
         al/OCwkMZCGzhmd9LjiNySTo8zslv7pfz0/4QtP+ZmVflcIEegVCKPzMWyhVfASJAXU1
         yF/uMKTNhljJUStAq0XbTQ9WcjBuFGmfWGpLKtkTz+kcgcaTnubZMBo+Q96ieLaQCikn
         0Wm8/+jPOsA7/DAYrB8nLLHpoaNAFpWPb9Z8dBH2VTdeydop2+W/mkL2INSVpfw5D+mu
         mNEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740918905; x=1741523705;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TSlBNjxFdfPRWaRfE5Fsi1hiMnyGQ/3j+AOhQpdfvzA=;
        b=pE4ot8H3nK9a6X5C43ZhnGNEV6lUHY4xoeeMfV4t+8Q0NJN2BgaGjNDZaXMgWEkQho
         +R4t8IvzE6VjxLM1EO6BtogVV0pi/IuHRIJAiEOyx/bATei0wA025Li/fwgiDUfht8bC
         T8QWH/4emSUjin5yRH4QE+JWDHg7slPeqI3eny/1mPilAqiNh3s7HS4QWKkkP7qZOr5l
         fexeXF0ZyGsvxIEuQn6agULEoFdX8Wa06oTOaICiKoUtEeEkoPu0PUNzkQ9hzRXhLpCp
         hzAlRNmVTykLdJSCw+D2pzjg6Id9OPBkVnGmgTsfG9pPlZcM/+XLEpWyg6EkiGK3qkbY
         IXpA==
X-Forwarded-Encrypted: i=1; AJvYcCXQ9+zG5bD0GMhuG0C2gxTAH7oVDgCJNc+yogUbGbl4PQi+RRMN+dcBEre3p9UI7mRTMWML@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4If7W60HJNfMVMxferjcgvgxZynSle/3R3fG6bFfb7i04KDxE
	OMfAdNRvk7D11VFbGn2LCZtJGC9idLNUoD/8aEAOywmT80lFRTDpzhrtBK0f3Uw=
X-Gm-Gg: ASbGnctMCWe0peOf/Go0IOWXPz+12F6WtOjvtDTzVg2wTHcM0481PhRqRW4CiHVN3UP
	owztdO66kzSxfKiACLT5WSQLFX3GdkcSyd01Up1sOV1VjLjAJ5sSpAcySyhGJHyx/b+dLbtTtty
	0OTQuBmeJKzGEO2ro0MKFIBtkiKjyhxIuN7k8YOicGcSmxDVJhUbOK1fMljjuzxR5oRG8lPDBnQ
	BEormu0iUNsgeQRv99bR2Y0B5UMIbJGdaZgQyV06PxnbfgvVb2zEADdN5vUS0SVld060GP1gnic
	NQtV1lOmDoOYAyB0+zbkENVFFxUAsAIYAUD4YvXxZlkvBgnYWg==
X-Google-Smtp-Source: AGHT+IFiul2Tnx/EbL5rX0pJA7tJd3ph0juB1ESj98roRTzavKY7yv/JOP1AJN9p5S1c8eGoz6o87g==
X-Received: by 2002:a17:907:6e87:b0:abf:56ba:d225 with SMTP id a640c23a62f3a-abf56bad60dmr613425066b.14.1740918905310;
        Sun, 02 Mar 2025 04:35:05 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abf6f85ea15sm97345166b.111.2025.03.02.04.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 04:35:04 -0800 (PST)
Date: Sun, 2 Mar 2025 15:35:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ethan Carter Edwards <ethan@ethancedwards.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
	Dan Carpenter <error27@gmail.com>
Subject: Re: [linux-next:master 2357/7423] drivers/bluetooth/hci_vhci.o:
 warning: objtool: .text: unexpected end of section
Message-ID: <dc1b62ed-8a86-4424-8a1d-bc20866fb4d9@stanley.mountain>
References: <202503011220.Y2e5vz4w-lkp@intel.com>
 <5jkf4f2bqmomecoxzzdyhdo2qg7dso2jihzwcox6zufnurrwtm@o5gqbsgmpldy>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5jkf4f2bqmomecoxzzdyhdo2qg7dso2jihzwcox6zufnurrwtm@o5gqbsgmpldy>

On Sat, Mar 01, 2025 at 11:15:46AM -0500, Ethan Carter Edwards wrote:
> On 25/03/01 12:30PM, kernel test robot wrote:
> > Hi Ethan,
> > 
> > FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.
> > 
> 
> Thanks for the email, kernel test bot. I'm not sure my patch would be
> the cause of this error, especially since my patch did not touch
> bluetooth at all. Only the ham radio driver. 
> 
> I did find an email [0] from a year ago with the exact same error in
> the same file.
> 
> Dan, what your thoughts?
> 

Is this a Clang bug?

I can't imagine what's going on here.  I didn't try the reproducer, but I
I downloaded the .config and did a clang19 build and it worked for me.  I
wouldn't worry about it.

regards,
dan carpenter

