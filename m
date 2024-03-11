Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8F63D986;
	Mon, 11 Mar 2024 12:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710160303; cv=none; b=Wlb1x6V+WmOPe+j7oVhLPFTLJcLwHDk0l78gmiQB8Y+icKnsb4gNVkFOcsIzekPL1pUzk68XnwXwwOwR9HpC/0MAyWcMaiHNhHop72zgt5jpLzm7QaoPxlxFCmxU8mv+TtuOemtmcNC/M4hhUvYHKGVBJ3RKcpRxhJj3C4QuRrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710160303; c=relaxed/simple;
	bh=EdM448FB9/iYoKH61bfb5XVsEpexHAoeqRr6pU6j+XQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ntOas9rcDEQYeKH4mx2FvWzJ2W+eV6U+DCzHSIK02VjkZT/hBcev5Cb6YqGLeSBxqxnxohaHvsGyPlgMKyvROzg7rNeIAzqQAraJTi9qNLRaxi3HWUZtnYxe0bb+Fb/+gHFp5EOmy2mMnz+CJRlZ0f8Po7PBY7Stq2O6mPBU2r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=daVEEwyj; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="daVEEwyj"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2d09cf00214so44611651fa.0;
        Mon, 11 Mar 2024 05:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710160300; x=1710765100; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EdM448FB9/iYoKH61bfb5XVsEpexHAoeqRr6pU6j+XQ=;
        b=daVEEwyj3G+i0/2V3KQsAQy6WUx54QzendD7IjLG74EJY094qhpSNAhB68LBSnJtH1
         jQffknvdWbnVFm9UdwgqE/BpF9ltGy+2mz42hi20nAAW79Z6QBUlSSxjWTuOfMEdzV3q
         KpRN/alIMNHtD+wApITmTll7DkqNW19Wqv6IBlAzTcSSCno6SX0qGdWULl7Qgrh8Uhsp
         DhwABsA5UftClp103KFQ47lLc2jsGWtWrWf04Kr3pYrdqNqEOut6qbrch83Zfd7NxKRh
         9D42UMur/V77qEHTJMxjdF4dtdUZGArfnBetHXVT3G4wv5QDUShh5TqqKmhdtmAko6la
         IXCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710160300; x=1710765100;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EdM448FB9/iYoKH61bfb5XVsEpexHAoeqRr6pU6j+XQ=;
        b=bkiKW5Ae8hI9D5DVr+uHPOc8ntHe1zlIWw23zPVnpViJHEAPhlx475Soqc6ZG7hQ3d
         s2+VnfV3wUFcmkQFgQDxcmv9C0hDmEdDLHpqd1pue6vOv85bK3g7/TIS1dwAVLfz2LYL
         rWU73TDROZfZkqmYriRhZCdH+BcyNX0X7RJFjuTZxEF+bbTyWB/yUBnM8TZO36FII1b+
         TFbgAXd0jv3YRhwb2WrCoDawumVl831PpFCSGHbxC7O90S9W3CkwKGK5RrvHNS54FsnM
         ocX5M6CDrlU9dhhr6yfZ/pfbW5A1UyK8qfE2psaO9au22+1cZrlZLmqsd+4039X+LVoA
         8pLA==
X-Forwarded-Encrypted: i=1; AJvYcCVEKKNQOVn67dkXG1ua58DmrxVeFUdG6+KCI1J66p3eOi/oYQcY8B0Xg3yeo1x264Mx9gAjuOBZI88n0MhcOa0zYtLKbO/ZqYbaQOt4babPvjbfu5EK/dzji4ymM2XhsZXMNLA=
X-Gm-Message-State: AOJu0Yw+6wyHoOpAZH2VESxhO+ajNuF+eMIjBEApgzi2zz+Pqfvj0OLh
	WhLSDxSJnP5tyynWS+HSFifH+A6KHWb+7hq1d1AELnSTscuU1DFodODVahjqffguABOi9gj46vl
	l/neaGyWkkoRnaetRyOi9O5OUVxrPv+nGN6MpdVDh
X-Google-Smtp-Source: AGHT+IGgH3xPWXYHquog9/cefkErcywJeZkFQJJaBl7g2wjM4WpGFZ4qZU1tNDeWqR2UhqFIsDhApBvfggDck69EADk=
X-Received: by 2002:ac2:4d0f:0:b0:513:a161:2c7d with SMTP id
 r15-20020ac24d0f000000b00513a1612c7dmr2859243lfi.64.1710160299639; Mon, 11
 Mar 2024 05:31:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202403092219.dhgcuz2G-lkp@intel.com> <CAADnVQJ+6mFs56fu+KEvumQ5uqM-oLpYx0hGxLJfE9XUCtEWEA@mail.gmail.com>
 <CANk7y0gT8bvKuhJvxG1yLTxdRycMKNEBtgEv_PsCA56Nv74cDg@mail.gmail.com>
 <CAADnVQLXFWDDV8xGLVRNd9JXaqOMfCO3ZGtuQUg8CZjrwLjxrA@mail.gmail.com> <CAPhsuW4=OPS+MgbsnsJM=pJCj64vg2xEG4MUq3hufWBkNDr-1w@mail.gmail.com>
In-Reply-To: <CAPhsuW4=OPS+MgbsnsJM=pJCj64vg2xEG4MUq3hufWBkNDr-1w@mail.gmail.com>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Mon, 11 Mar 2024 13:31:28 +0100
Message-ID: <CANk7y0jWEx4Ziym=6dNZ7kZFgj=MfKdaS5qYJZPnx_DHCc0GsQ@mail.gmail.com>
Subject: Re: [bpf-next:master 5/7] kernel/bpf/core.c:900:5: warning:
 '__pte_index_size' is not defined, evaluates to 0
To: Song Liu <song@kernel.org>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>, kernel test robot <lkp@intel.com>, 
	bpf <bpf@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>, 
	oe-kbuild-all@lists.linux.dev, Alexei Starovoitov <ast@kernel.org>
Content-Type: text/plain; charset="UTF-8"

> > I think hard coding is cleaner and less surprising.
> > I'd like to hear what Song thinks about it.
>
> Agreed. Let's just hard code it to 2MiB * num_possible_nodes().
>
> Thanks,
> Song

Here it is: https://lore.kernel.org/all/20240311122722.86232-1-puranjay12@gmail.com/

Thanks,
Puranjay
