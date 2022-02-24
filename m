Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3797B
	for <llvm@lists.linux.dev>; Thu, 24 Feb 2022 17:58:21 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id D599D212B6;
	Thu, 24 Feb 2022 17:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1645725492;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=y+SfGyKbjJ/KD7Gcn4fvmLlw2ONQyJxRmjN1xSRW1T8=;
	b=qYo9rvy9wBBnLaLlKedVi+vZtJRAc5PXMubxDLXnJZtX9xp/1YSOPnyZmxaVDXBWuA20r1
	Sk/35YCQidanVN9NokQ9ULxojJNUkF05GJAORU6eytzYXxJl4o0EcUr2No6DHvG6bnXzeW
	di+J6SfhYnNWyVzy1XYZFO9zt9JE12Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1645725492;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=y+SfGyKbjJ/KD7Gcn4fvmLlw2ONQyJxRmjN1xSRW1T8=;
	b=XyhdSA8s5izrePQgl3LCccpzBYO4I8Udi1H7oemQi31Qo4Y47hGUIlrKc+ZqTjhv1sinX4
	bC88YTG6RWBkG8Cw==
Received: from ds.suse.cz (ds.suse.cz [10.100.12.205])
	by relay2.suse.de (Postfix) with ESMTP id C96AFA3B85;
	Thu, 24 Feb 2022 17:58:12 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
	id DCC10DA818; Thu, 24 Feb 2022 18:54:23 +0100 (CET)
Date: Thu, 24 Feb 2022 18:54:23 +0100
From: David Sterba <dsterba@suse.cz>
To: kernel test robot <lkp@intel.com>
Cc: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>, llvm@lists.linux.dev,
	kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
	David Sterba <dsterba@suse.com>
Subject: Re: [kdave-btrfs-devel:for-next-20220222 101/120]
 fs/btrfs/super.c:75:13: warning: unused function 'btrfs_state_to_string'
Message-ID: <20220224175423.GY12643@suse.cz>
Reply-To: dsterba@suse.cz
Mail-Followup-To: dsterba@suse.cz, kernel test robot <lkp@intel.com>,
	Sweet Tea Dorminy <sweettea-kernel@dorminy.me>,
	llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, David Sterba <dsterba@suse.com>
References: <202202241019.HFKHBOYe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202202241019.HFKHBOYe-lkp@intel.com>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)

On Thu, Feb 24, 2022 at 10:59:56AM +0800, kernel test robot wrote:
> >> fs/btrfs/super.c:75:13: warning: unused function 'btrfs_state_to_string'

This happens when CONFIG_PRINTK is not defined, I'll add the ifdefs
around the definition.
