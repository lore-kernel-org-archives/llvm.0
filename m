Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EA53F4854
	for <llvm@lists.linux.dev>; Tue, 11 Aug 2026 21:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786483377; cv=none; b=O9aShnbwQCmkzLgUyo9RN5Uj5GeLhh4lw9yf9/CqyWIbpP229pQ3LNm9fLx1pORvaRCjVHy6MqWC3TtykTf5/bEDiCd6vplxpFX2+u+pxKfVZPlTh7DmU2tqzuB3RGki95NDewMDn0bPYq/4nLIfSmgjHd8mSef6oORIHYhmsus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786483377; c=relaxed/simple;
	bh=XN/rifqNvJQDtxhcJX1CkOjTxm/idHUoaQKoCIcr3J0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tMEhdf7EhfOxiRpyY3YpeYXKsXDxDXxAV965HI7ivlx9CAw2Sy12xEFQ9bV+sdkitxyz1iQOdMDbE3Txa6ggA8B571XjB12g3nhnxG3IwehW8kQDacDi0yfVrGtyCJwGMoy9Yeq5DcqcmnANDVblI6qYTaIMtgmLIJTuutEwgW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YDg+BMXX; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YDg+BMXX"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84830c774a0so444957b3a.1
        for <llvm@lists.linux.dev>; Tue, 11 Aug 2026 14:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786483376; x=1787088176; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=duzXNp2G2UESyfsX/Nv+I5To/x8QlNagRZc9TfujvZ8=;
        b=YDg+BMXXDNxAfTn8w5QNYK8Qo8/xQ4n5VyuiaozsHxudgGlFw6bjXSm1xYexdGzU7u
         4fcOY4L+9Q2Hh/ikl5vtak5TDXNLSYCLO6/hu0Z67uXiTQ1UrfkcLIE1caaYO8F1EJ2i
         fGjKYFzJRl8Y6+rPG1U6Ah0yiWB+w3/oGn2C8cmizEiVQGv9y73m9Q7al+u2EF2ZQ8tB
         09zsJkwyDRwaIJaeB2bD9J4xJ2/5gm4UQCsmR4CI6TmIsag48IA1HqccCPu8rTfpcCjs
         kmqwp/037vpUWoB3X8sGlq/Z162YO60gvwhSWRNpmgY74TOmlSqi8R7FKVd3l3JU87gi
         DRFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786483376; x=1787088176;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=duzXNp2G2UESyfsX/Nv+I5To/x8QlNagRZc9TfujvZ8=;
        b=jxluKR5noi9S9UJaq9pngb+tyR2GzeWL9g7HZcdHUO5vvA7b8E/OIMTSXIXFvTqHZy
         oiIA8Q0VZcOOn0Y/azAkAtN3jneoBIX/H/wL3GGGDDhtZB5pUkaMF+16aMbU1uBO9xo/
         P648EykoUWAms2Vk5sWlwYGFyN6omQ9mBntyDxnHtPFOOyoCEH6FoFDzbcftsX0AQfhx
         kb/kknqIaAgVB3AYyGar1+3iM2rqCYdlzS9KiMZY8bZZ9vD1JbnNiV71SBrc4CidFzBK
         9SZddii7xlQ/8o4FEKxQniLCdv60WmrNqpRAQ6Wn2SIuX5GnSnLLxvboxCa4s3qCdtuE
         M7cw==
X-Forwarded-Encrypted: i=1; AHgh+RppSNUejH/XD37TMXeX+XiwyiOjLWBfcIpdS00tLk+cHRjwlXFn1NyJ1qREB/y4LERfmJWu@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4rnSO9L/GgR2lvZU+wuC4h5vPDq4I7MXTGQRrs0R6+zawuxgf
	MPO5SGJCP+YXwmOT/91xr24CXz/oCg9i7Z0JxK99Tl7/SNobqmgSaFAwsUovBpIk7Q==
X-Gm-Gg: AR+sD11UqD4wH8BQmTZAqUZlmbIhwYQjjEnOZ55k0YDwNubRTpZ4L8ceEp2gwIwfvSh
	kMPjszHbCq7MZdn4cxtSFdx7CXLg/dtnaK/gtjKHX6X6ZDTfGR96mT9lnxc4WbWllSi78DKV8hV
	th0asPhIGlk8MG5gBjVm9uVeSXgIG81e1mz0awsLd0Rafa2Os6XXFIGmMKViKFMozu4U4E0a3EB
	/7JJ+Fry9N/ALb8wIYsSjDaxw7+wj/0VlINl/VfgGw/LIXuZ9qLi0mMs13EbgwIbp6pQWc1XiRH
	zIceHaKzY2QyTF9r39HcpQco2j2aIj6rnnYExmfp0iM+Vn6y4CmJvMYbRdjUYgLM0ceLo7mj83n
	6i03bCJjc1sOS4MZM3TR2MTvo80mxOEZJwpB/jEZJJ+DPdRqHBOOtb+kqoYVFK/kGjUmSSpYtuM
	5P8qhE4zhQVvX5B1Pp97EeGxHVdoeGD1j7CAMZYuTfa8riMl99uYGaHPVcnq18gH2tz8nDt/rLm
	Yz1aDhfW6Ld8ukKFRnle/c9y4mL8g==
X-Received: by 2002:a05:6a20:a105:b0:3c3:a168:edc3 with SMTP id adf61e73a8af0-3cc2bcbf252mr7676629637.38.1786483374995;
        Tue, 11 Aug 2026 14:22:54 -0700 (PDT)
Received: from google.com (132.200.185.35.bc.googleusercontent.com. [35.185.200.132])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbed8bdaeb5sm1461553a12.11.2026.08.11.14.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 14:22:53 -0700 (PDT)
Date: Tue, 11 Aug 2026 21:22:50 +0000
From: David Matlack <dmatlack@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alex Williamson <alex@shazbot.org>,
	Justin Stitt <justinstitt@google.com>, kvm@vger.kernel.org,
	Leon Romanovsky <leon@kernel.org>, linux-kselftest@vger.kernel.org,
	linux-rdma@vger.kernel.org, llvm@lists.linux.dev,
	Mark Bloch <mbloch@nvidia.com>, Bill Wendling <morbo@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>, netdev@vger.kernel.org,
	Saeed Mahameed <saeedm@nvidia.com>, Shuah Khan <shuah@kernel.org>,
	Tariq Toukan <tariqt@nvidia.com>, patches@lists.linux.dev
Subject: Re: [PATCH v3 11/11] vfio: selftests: mlx5 driver - add send_msi
 support
Message-ID: <anuSqnU7WPy-9enn@google.com>
References: <0-v3-76f117ad04f1+28a90-mlx5st_jgg@nvidia.com>
 <11-v3-76f117ad04f1+28a90-mlx5st_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <11-v3-76f117ad04f1+28a90-mlx5st_jgg@nvidia.com>

On 2026-07-16 02:03 PM, Jason Gunthorpe wrote:
> Wire an MSI-X vector to a dedicated EQ so the mlx5 driver supports
> send_msi().
> 
> Each EQ can be linked to an MSI-X vector, and the CQ can be set up
> to deliver an event to the EQ. Thus, when everything is armed, an
> RDMA WRITE posted to the QP generates a CQE, which generates an
> EQE, which generates an MSI-X.
> 
> To keep things simple this just re-uses all the existing QPs and
> CQs, so they generate single MSIs during memcpy.
> 
> send_msi() drains any accumulated MSI EQ events from prior memcpy
> completions, posts a small signaled RDMA Write, then polls the CQ to
> consume the resulting CQE (avoiding stale completions on subsequent
> test cycles).
> 
> Assisted-by: Claude:claude-opus-4.6
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Acked-by: David Matlack <dmatlack@google.com>
