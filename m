Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2141F942D;
	Mon, 21 Oct 2024 19:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729537447; cv=none; b=ImTf/hixCDAcsRhyWVDanmWFY/yXre6DdkXITadwP/8EvmF0Mw4ugx7HdtVkcRJNmJSdSb6bKBFCgUZtsKIU4Svyo3uh0HtmBnSzpFj0AUp2npC5J6NjqveIMAFRT5ReL0cAtQRg3StRPu0cL0RK7qAeX+eCSmp2I8PbF6z6WWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729537447; c=relaxed/simple;
	bh=ukxvHPCYUpZL3K/79uMmkg/peC2AgnCZIHDlVf+aflA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H4CYGWqy+VpGy/UVjxVwnI0priq3U3OqDcld0VGLNhwcrGTNQvm7AVvyk23rX74eCFH1KAl736LV8PQnOXHAnh1J2oMu2SJdy9BsNypwg7n7cI3ZJ81aK+UjZMigF0ohUaRq2VRAYH45ZXLahUP9ZnkV66TXRWqTuQqAVzhM6NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=N7VkdyQI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="N7VkdyQI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04A6AC4CEC3;
	Mon, 21 Oct 2024 19:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1729537447;
	bh=ukxvHPCYUpZL3K/79uMmkg/peC2AgnCZIHDlVf+aflA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N7VkdyQIASsBcgKi3Ier5YOUzEko8mYW4FPaNB8g0l7kNNOkrGxNTzzaIr9OEwwvt
	 ZRQbI04CAeud/BOIhzvytR8iys7V6ctV672KJnaS1/j6ChnAAkIHftTT+auMx+OcGk
	 gisvB6pgulYaXagoQuKkHER/2XNhJ9sK+ag6d95U=
Date: Mon, 21 Oct 2024 21:03:58 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Ricardo B. Marliere" <ricardo@marliere.net>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, devel@driverdev.osuosl.org
Subject: Re: [driver-core:const_work 31/40]
 drivers/bus/fsl-mc/fsl-mc-bus.c:409:5: error: initializing 'struct
 device_type *' with an expression of type 'typeof (fsl_mc_bus_dprc_type) *'
 (aka 'const struct device_type *') discards qualifiers
 <gregkh@linuxfoundation.org>Greg Kroah-Hartman
Message-ID: <2024102147-lunchroom-anger-5a4e@gregkh>
References: <202410220209.WYSCnfNH-lkp@intel.com>
 <gynt2dgjjxsj5rxgzffs4omfopgmgleumgpjub6vmybpxz5rzu@vwpi7jnimguo>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <gynt2dgjjxsj5rxgzffs4omfopgmgleumgpjub6vmybpxz5rzu@vwpi7jnimguo>

On Mon, Oct 21, 2024 at 03:55:15PM -0300, Ricardo B. Marliere wrote:
> Hi Greg,
> 
> Please consider applying:
> https://lore.kernel.org/all/20240904-class_cleanup-fsl-mc-bus-v2-1-83fa25cbdc68@suse.com/
> 
> Instead of:
> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git/commit/?h=const_work&id=cfd1974cbf0023d6d6de9e410aa1860d5a34c132

THanks, I will, this was an old branch of mine...

greg k-h
