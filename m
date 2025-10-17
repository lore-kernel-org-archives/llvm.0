Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A857531197A
	for <llvm@lists.linux.dev>; Fri, 17 Oct 2025 10:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760695941; cv=none; b=AGwevuFZ3J+7OM5LVvfwJ4148I3ear0W78iOtghn3XveEjcvCgFdthBvVPtPd7q/GeUVdY/VwZXFJfeB2ft9KEMpgPl/HcexURpGAPEVthuEImIBkuJjRcnhQ02LJSGwZVrTIB3UJHUZj2WzEl2JayvFxI78/Mj5iqYumL7Z/iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760695941; c=relaxed/simple;
	bh=LxfKf1rMuw5rL6S+6Rg17frkQTovaCXaZTfO70TM6oQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hV5UhhOpzyYYIcwNNLShG78STJlZ0gvjKHipnqp0paeCAce053s+xHNVOBcE56/b+j5ph53dytnDHvGz6jjBJcDCIEsWbWWWk6AnPE0wz1Dx9W/tRHfRpdCkFg63fLnPfKYy6Mj7nC/lkRIWCljPtkzqM1bxJBfD2qAyJQms52s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=abK1j6dB; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="abK1j6dB"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-46b303f755aso17704925e9.1
        for <llvm@lists.linux.dev>; Fri, 17 Oct 2025 03:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760695938; x=1761300738; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IcAE9gTZ+/oZemSW/gjSvTAcO1JCiHDPx7fInOY/f2o=;
        b=abK1j6dBgh7c15j/nQudG4rZmewWTGqkhsTdra0hj/1HP/XcrwVcmmDcheNuydIGrV
         3eqo8cyA8AThz3S5rwkG2jzdheETPnENmb0difrI5oMuvFOcb6zwXUBplcCkBhQAX8uI
         EY7XcbTbMINYrtzQpQoqUKppsRxwFpzyYFVeWP4KOk6H5pCbVH8FqyXXDEGg0ZwOW/Hn
         1zy1ljzIsXW6v9YTOuoWVGXkm+FxVQtJyJ+GqbV6VDVxLgioHYiGmKXn2S+aqsZT+xVn
         T5RPh29m69Fz3hDq5x9GpksJm9nWbqJB5Wen+Dbe3n52EVS8uoz/DrbGneC37rXrrnXl
         Ak3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760695938; x=1761300738;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IcAE9gTZ+/oZemSW/gjSvTAcO1JCiHDPx7fInOY/f2o=;
        b=DQ9s4WUEycNX68tzHYwalBvaGp3zRLOsITg3I4V1sFdfes0WBd1x/eBR7/q3cIfrog
         qTHqpSMXbbO6KaBJ3r34Ml90C1ZyeToNSOTl/2BhTplN1DwNtmbjhXGJ09fehYyiegGV
         l1r1cU6ijWF2iXdI0eNygJCTrajBlcMU2gv5w2FvVv5sBy2F4IuyRyPeGfRIvooFkreJ
         NyTUe/YUe3jNm1cQ1dLknOqPbXrQv04H54MltNCQPN9YXZCY6wSoxXJzxWh7VoVzsJrz
         pFlr0BrSrlLZKXrC7/yXYGSgnywixQIFugSYSLC3zf+n/oT3wsaHd37JrGTJQMFFWW6o
         8MIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXf6DXwT/Na23UfKOL596mms8X6nNfYpEEbkQCo9dezcwWQkYb1oP81477xNNi7pGArmxGC@lists.linux.dev
X-Gm-Message-State: AOJu0YzrltQIAWYV9HyPSkNpsCvgo/XwP/SCRr6COR/6emHx+TerjkZD
	JxpN8zkIFNYebwdmCz8m9oRwkx4zTHvsuEH5FCsKm7gsxmPrKkuob4Il+x2uYgvXrYA=
X-Gm-Gg: ASbGncuXAP77ieFWpwa/FIIYzqV1OraYHA/trZ14mGgFbiU1hj1W4Ca3GJjuTozsilU
	QeIUJfXICLektWo75u8HYW/GWw7Ub/WDF7S41W/Xs6swYJnj66iostjTssy9aSX1Tjx4gRLReTy
	cGL0cru+vXwtL6H3fmPxOEUUi4+9ksm503vfy7ItQ18L+GrX5Sq82EEG1Oqg1/nvMkPLV0QjI31
	Usq2Ts3QNO6p1E8ISbl5X8v7aWtWq+OAABoqA6mJU7vXYeFNB2BWdP1H2DjKM7ZakcLnR4pT422
	zSo/l+E3y5jw1fRQc79fdZHXlvkcHGbnPIkfd5o2qxN5Dex1TWz0Cdg45n0MdM+VTfg3DZRjaug
	kqBmMBVQqRTlSh9AuKKStk58nRhODGucSBaBT46hWaFAP9rGmIA97Rxzq9YnVyphP5rIyvoJj1L
	6pad9mt9I92M9vbw==
X-Google-Smtp-Source: AGHT+IFPljBKrOVB/66ijJCXVaRvUIH/JjXGzjIhcC63OF8E63IkVl0Uh+QOhjfWccM7pXPnZ0iuRA==
X-Received: by 2002:a05:600c:3145:b0:45d:e6b6:55fe with SMTP id 5b1f17b1804b1-4711791e7a4mr29591645e9.34.1760695937835;
        Fri, 17 Oct 2025 03:12:17 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4270665efaesm3215957f8f.27.2025.10.17.03.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 03:12:17 -0700 (PDT)
Date: Fri, 17 Oct 2025 12:12:14 +0200
From: Petr Mladek <pmladek@suse.com>
To: kernel test robot <lkp@intel.com>
Cc: Marcos Paulo de Souza <mpdesouza@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jason Wessel <jason.wessel@windriver.com>,
	Daniel Thompson <danielt@kernel.org>,
	Douglas Anderson <dianders@chromium.org>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	kgdb-bugreport@lists.sourceforge.net
Subject: Re: [PATCH v6 5/5] kdb: Adapt kdb_msg_write to work with NBCON
 consoles
Message-ID: <aPIWfjBhFPjOmESL@pathway.suse.cz>
References: <20251016-nbcon-kgdboc-v6-5-866aac60a80e@suse.com>
 <202510171023.YREXxhMK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202510171023.YREXxhMK-lkp@intel.com>

On Fri 2025-10-17 10:17:37, kernel test robot wrote:
> Hi Marcos,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on 3a8660878839faadb4f1a6dd72c3179c1df56787]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Marcos-Paulo-de-Souza/printk-nbcon-Export-console_is_usable/20251016-225503
> base:   3a8660878839faadb4f1a6dd72c3179c1df56787
> patch link:    https://lore.kernel.org/r/20251016-nbcon-kgdboc-v6-5-866aac60a80e%40suse.com
> patch subject: [PATCH v6 5/5] kdb: Adapt kdb_msg_write to work with NBCON consoles
> config: i386-buildonly-randconfig-006-20251017 (https://download.01.org/0day-ci/archive/20251017/202510171023.YREXxhMK-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251017/202510171023.YREXxhMK-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202510171023.YREXxhMK-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> kernel/debug/kdb/kdb_io.c:612:22: error: incompatible pointer types passing 'struct nbcon_write_context *' to parameter of type 'struct console *' [-Werror,-Wincompatible-pointer-types]
>      612 |                         nbcon_kdb_release(&wctxt);
>          |                                           ^~~~~~
>    include/linux/console.h:667:54: note: passing argument to parameter 'con' here
>      667 | static inline void nbcon_kdb_release(struct console *con) { }

This should be:

static inline void nbcon_kdb_release(struct nbcon_write_context *wctxt) { }

Again, no need for v7. I could fix this when committing the patch.

Best Regards,
Petr
