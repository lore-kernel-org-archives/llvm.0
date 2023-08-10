Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFEAC1C16
	for <llvm@lists.linux.dev>; Thu, 10 Aug 2023 06:40:08 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 52FB26607214;
	Thu, 10 Aug 2023 07:40:06 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1691649606;
	bh=uOhqG4fispv1HyT2wcQA5GUwaFe6s8niX9CF29QCBcU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=or8l/s2hclUj6kLR9o2yS5mQ0v212t2y9IL2hyekXL5y/QRFsn/r/gWKOJmhkXFTk
	 dpbClVxX715GI5WgilckC5gJzAt/ZG93CUo9LAaV8VFGbWD8V8TQMQkSRqknXIR56k
	 ybaSjGUW3QNhQ8/A8QLeRq7JrCrpv+MogMLOr+5PKaGQvThzk+GK21iBpYND1RCsnc
	 ODYv5POT0b5o+du806UAiaSYD9huuZXyWgsTMyc9YIWIrJc9AIoXbKw7LtqtlTEML8
	 WgzYDtJcBA/vuSZIhu9EqDIa0Z7wrEjpQwQ2pjZGiHjs1J2HsnS/D44VrSFmUsIs1O
	 MBZnw3JUzcvTQ==
Date: Thu, 10 Aug 2023 08:40:02 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 ndesaulniers@google.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, trix@redhat.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 naresh.kamboju@linaro.org, dakr@redhat.com
Subject: Re: [PATCH 1/2] drm/exec: use unique instead of local label
Message-ID: <20230810084002.636cc827@collabora.com>
In-Reply-To: <20230809153755.GA832145@dev-arch.thelio-3990X>
References: <20230731123625.3766-1-christian.koenig@amd.com>
	<20230809153755.GA832145@dev-arch.thelio-3990X>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 9 Aug 2023 08:37:55 -0700
Nathan Chancellor <nathan@kernel.org> wrote:

> Hi Christian,
> 
> Can this be applied to drm-misc? Other drivers are starting to make use
> of this API and our builds with clang-17 and clang-18 have been broken
> for some time due to this.

Queued to drm-misc-next.
