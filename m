Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530F2197A7A
	for <llvm@lists.linux.dev>; Fri,  9 Aug 2024 15:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723215636; cv=none; b=O/Mk8tZEtHYbLSnTcRevP8BzhVi+yGw54z14ZoJHL/Xr+z/nCSB7fRDXMV7BaTqxdS7dFdBGQJ3pbJ4WgNyr5LDtrTmkVbtwEFhAKLd2Slqe7ZzahbrubH4239OtA4wNd1Nn8fTkUN+hA4RC0Q+XTgjG8zOGn0HKVNThNKx0L58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723215636; c=relaxed/simple;
	bh=dawj/tBNKTzYnHcU/KDys36vwXq748o8gOQyRKuQV4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=phqGefcAPCFnAqTlSsVCbiu7LAQhf126S9n1FcPDHKH47ocHB7InqfwtbNf4LNrbG703quSQuY0wWTjFGpUpDzSo6d5OE8wLBCWqbkvniUcqe4x4fyIUXP/yka31ed0WOZK4Bygz5FvKW+k3z1lH4HaB0a5Gc6rNvuDz0PDiWFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZvmMvyDh; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZvmMvyDh"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5b8c2a611adso2736821a12.1
        for <llvm@lists.linux.dev>; Fri, 09 Aug 2024 08:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723215632; x=1723820432; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H0rn7UZ3HG/DD0FX2FGCBFvCYFqEktL4MovS3L/vtSM=;
        b=ZvmMvyDhMpNH8JCtYfe+pp5IAITXS4MvL82xQ8ZT0RYJj+n5lyIGr0DwpQE8HlIej5
         Jep1YeR+MJi52rUMexgi0QFchIxgkRFKky/h7i5z8LdW9hbTMiw8J2gMF5gVbEdxjyWj
         5Anqep43LVo+5uFQfd85raHTVTKFTwltaGO6MGX8iKJoCTDb4ecs1iIMFXMx3zmg7VkA
         XRN0k3RBvZa8/Xa3rvAvu3+BdxbNwL7A++FSwnBvDRX6LJc4DkCSKv/YN/Dx7dKjMl/9
         eueHVDH+Mo+KDsGoPqCX2PGB8Ew5Y1qcFqwy8zvXQnNL/7DE+XzBygvI4Y7lY2cj8OgN
         A14w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723215632; x=1723820432;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H0rn7UZ3HG/DD0FX2FGCBFvCYFqEktL4MovS3L/vtSM=;
        b=VTnmgB1UxIVc85h+rk0awHWX8aIiZ53IX+xZQpro5b13NqHqZwrcL43cjsxlIE0Mjb
         v1s+rdx0+AsY3bXEXg61aYVvDQ6uSBRure7/k7YcOuY03Xi6huRBOh9eDvLju1l2UzgC
         BTRog3SgRTyfUBEEAkMBbU9LxkMSyYAQZhZY+4Utis0kZMmDmtG56aJg/Pr332bhhVgE
         eX9I8gY0ppCJmg5eHzfGT0EBPBpVarr+42KPi2dFsh+FfLuXmfhmLu+oIpi7FmrcRhud
         96MdAb2vwUvZ7hZtgtfF4Ft2EdtZmxJKq21Ml88Ku4H3Cv5GiNqxMmWDO12SZzlNWfL9
         LskA==
X-Forwarded-Encrypted: i=1; AJvYcCVOEP5S20yKhWyG031KtXdFUDnUasE4QHyePQFgbACioT9epzLAhfmGaW5V4xF2pqjQL+VP7EM6rwXOJiiQhEKUU4t2Zw==
X-Gm-Message-State: AOJu0Yz0AyOZyexBnaqD6oQGf1k0nvI/OFyXGrtARzWtGZQ+Y0rOS7AQ
	RoBrhJJCU+Z12dWw1vI2TZPqd58nv4JkNmhvl2jno+mucDyKDT6m1eX9E/Fdz6M=
X-Google-Smtp-Source: AGHT+IGimyb61sKhw+mRuQVbC3bE2Obmy5HP7cvL4gIjsSjX8fXY+fkEjJOzQlmt3WtZxu0/FhFwCQ==
X-Received: by 2002:a17:907:c7e2:b0:a7a:1d35:4106 with SMTP id a640c23a62f3a-a80aa557a83mr159871766b.5.1723215631262;
        Fri, 09 Aug 2024 08:00:31 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9bc3c6esm866125566b.15.2024.08.09.08.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 08:00:30 -0700 (PDT)
Date: Fri, 9 Aug 2024 18:00:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Su Hui <suhui@nfschina.com>, David Howells <dhowells@redhat.com>
Cc: sfrench@samba.org, pc@manguebit.com, ronniesahlberg@gmail.com,
	sprasad@microsoft.com, tom@talpey.com, bharathsm@microsoft.com,
	nathan@kernel.org, ndesaulniers@google.com, morbo@google.com,
	justinstitt@google.com, linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] smb/client: avoid possible NULL dereference in
 cifs_free_subrequest()
Message-ID: <893f2ebb-2979-4e34-bdab-a7cbb0c7e7b8@stanley.mountain>
References: <20240808122331.342473-1-suhui@nfschina.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240808122331.342473-1-suhui@nfschina.com>

On Thu, Aug 08, 2024 at 08:23:32PM +0800, Su Hui wrote:
> Clang static checker (scan-build) warning:
> 	cifsglob.h:line 890, column 3
> 	Access to field 'ops' results in a dereference of a null pointer.
> 
> Commit 519be989717c ("cifs: Add a tracepoint to track credits involved in
> R/W requests") adds a check for 'rdata->server', and let clang throw this
> warning about NULL dereference.
> 
> When 'rdata->credits.value != 0 && rdata->server == NULL' happens,
> add_credits_and_wake_if() will call rdata->server->ops->add_credits().
> This will cause NULL dereference problem. Add a check for 'rdata->server'
> to avoid NULL dereference.
> 
> Signed-off-by: Su Hui <suhui@nfschina.com>

Needs a Fixes tag.

Also when you add a Fixes tag, then get_maintainer will add the David Howells
automatically.  I've added him manually.

> ---
>  fs/smb/client/file.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/smb/client/file.c b/fs/smb/client/file.c
> index b2405dd4d4d4..45459af5044d 100644
> --- a/fs/smb/client/file.c
> +++ b/fs/smb/client/file.c
> @@ -315,7 +315,7 @@ static void cifs_free_subrequest(struct netfs_io_subrequest *subreq)
>  #endif
>  	}
>  
> -	if (rdata->credits.value != 0)
> +	if (rdata->credits.value != 0) {
>  		trace_smb3_rw_credits(rdata->rreq->debug_id,
>  				      rdata->subreq.debug_index,
>  				      rdata->credits.value,
> @@ -323,8 +323,12 @@ static void cifs_free_subrequest(struct netfs_io_subrequest *subreq)
>  				      rdata->server ? rdata->server->in_flight : 0,
>  				      -rdata->credits.value,
>  				      cifs_trace_rw_credits_free_subreq);
> +		if (rdata->server)
> +			add_credits_and_wake_if(rdata->server, &rdata->credits, 0);
> +		else
> +			rdata->credits.value = 0;
                        ^^^^^^^^^^^^^^^^^^^^^^^^^
Why do this?

regards,
dan carpenter

