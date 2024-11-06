Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDD820ADD2
	for <llvm@lists.linux.dev>; Wed,  6 Nov 2024 19:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730920732; cv=none; b=EDhZgf25Dm8ryTQXum4XKzzSB/47jmwrmBGNNYph6POYsQ5j8mljuK0VkZ5WlxuftgA1z1mSPo6oNr8QPIsEgdif+7F8KqOHYhDYGupHQhYPKQcpdJSBZ1GnkgYpibKSJrYoF4DxVqggnItxCvJpOU4WbIZDTDJy7jxepiRFkhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730920732; c=relaxed/simple;
	bh=qOe1CXVlc6MFF5iYmoeU/kZHwPZE0z1YOhnSZJKpHWc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VHwhNCW3F7YF5Bdy+AK7lWJceuTbdina7Y9EpMbVHbDdRtas4dAjETcK9iveRITGbctVdqMnNBshr+jHBOKmIfEpP226vs0/AzkdVIlFYxU3gHzS4VpmXIzCnvFkjNKFi5B3jOiSXxPWDJEb2bVrsQLEMo+DoqCvkbT12Zz7o+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readmodwrite.com; spf=none smtp.mailfrom=readmodwrite.com; dkim=pass (2048-bit key) header.d=readmodwrite-com.20230601.gappssmtp.com header.i=@readmodwrite-com.20230601.gappssmtp.com header.b=BXNX78pg; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=readmodwrite-com.20230601.gappssmtp.com header.i=@readmodwrite-com.20230601.gappssmtp.com header.b="BXNX78pg"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-37d495d217bso92539f8f.0
        for <llvm@lists.linux.dev>; Wed, 06 Nov 2024 11:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=readmodwrite-com.20230601.gappssmtp.com; s=20230601; t=1730920729; x=1731525529; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qOe1CXVlc6MFF5iYmoeU/kZHwPZE0z1YOhnSZJKpHWc=;
        b=BXNX78pgZ3XwXdvBDgFjsX81li07P/NuopPA3YqhIkIQjY/LifeOvb2TjNZ3E/rOLl
         bpR3X6fHvUV8sExrXzmVybLQ5f+p3/uaUzIyHWvWY2Rc464R820bVOMrOUG3qPxJuZsr
         c3frTxGPTVTnzC3WdOOzl877xBQC8vocu7TjyQ/aGNB+SJPWMADPCsxeQHw07qjhlla6
         GZZyl4nCyOiNdfEffirn/XAehE+LSfzkjn4bFBMzSJ/fS/PABr1gxPqaWOyRE9kenPXF
         tYCK1AUZivQ7r9xQWq5VMsWiQ8Jd3cnExl7YMFwCebvoZn+8z+/Aeh0H5+jx40bOT2Id
         cwRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730920729; x=1731525529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qOe1CXVlc6MFF5iYmoeU/kZHwPZE0z1YOhnSZJKpHWc=;
        b=wrwBEzK3Avc5q/Q7dIQP/UI81WVrTqgkcONweFUkFy5sZXWA8js44ibLjdG+TB6Bac
         uapnye5hAeofw5Krbhs9rdKelnBUaghgaS4IuGRxzn+FA4Yrb2WfQHlqQ5C4hB6q8rS2
         0/9pr6idKnWj4W4Mu9sKuRKRAxl60lpKB2l/dJ2/goreKDjmPh6NPONEfQnCWQJhULow
         5ZPda7zaGkZZ/rUDcTXSPOwAWhZlikrxgFgMoqdQj/uQkau7T3MT8dejEbvcMybJ2fne
         2PZBPxPvGeDsjKoef3NYcZ8FQQVpoIBte91GJptVzyMAdnoPlIeYcww5kimQgqkBjpnj
         xxfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlK8O2F/RZh9SHNQdtFMfUDqTWL1EkonctBFWO4xTzmvL+XaxFXi2vJkxGCzR34I7wlTiG@lists.linux.dev
X-Gm-Message-State: AOJu0YyG85Un4bGQme8k41/R08TTjIvECydw3XWSGOTEt4KgVi+WbJ2B
	aESASpA8pvHCLASOvoA6svo9T97EjmZFHpZO/Z6bxurjL6hdoIj1HoFZQUluXfA=
X-Google-Smtp-Source: AGHT+IHIfvSuVMYE/OJ5z1Vf/8NWtnI3qpI11qZI1ZDjCQ5R1eoen0eQA7m2x6FHYRcVHKNghMdtTg==
X-Received: by 2002:a5d:47ac:0:b0:37d:48f2:e749 with SMTP id ffacd0b85a97d-381c7a4636cmr20971751f8f.10.1730920728680;
        Wed, 06 Nov 2024 11:18:48 -0800 (PST)
Received: from matt-Precision-5490.. ([2a09:bac1:2880:f0::179:1ba])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10e7387sm19855419f8f.51.2024.11.06.11.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 11:18:48 -0800 (PST)
From: Matt Fleming <matt@readmodwrite.com>
To: nicolas@fjasle.eu
Cc: benh@debian.org,
	justinstitt@google.com,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	masahiroy@kernel.org,
	morbo@google.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	re@w6rz.net,
	kernel-team@cloudflare.com
Subject: Re: [PATCH 2/3] kbuild: deb-pkg: add pkg.linux-upstream.nokernelheaders build profile
Date: Wed,  6 Nov 2024 19:18:46 +0000
Message-Id: <20241106191846.2079521-1-matt@readmodwrite.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ZxkYYLbiXZ3p59iu@fjasle.eu>
References: <ZxkYYLbiXZ3p59iu@fjasle.eu>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


Hey there,

Can you explain how this change works a bit more? This reads like it's now
impossible to build the debian linux-headers package with clang? At Cloudflare,
we're using a custom build of gcc, not the gcc-x86-64-linux-gnu package, and
with this change we can no longer build linux-headers.

What's the solution for those of us that want to build the linux-headers deb
package but can't install gcc-*-linux-gnu?
