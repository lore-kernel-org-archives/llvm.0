Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F65884A3E;
	Sun, 17 Nov 2024 21:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731877812; cv=none; b=nX08Ll7fqopN5CZADw8o9PT4WJS6YNRdSSqqJxDE9MWp9KJUup6XxrSEU8BLEa+tkSYpqTozs/Erm1nO5vod2NHlO/ng7jN3vxEKGHmB3pAJ+xFFojnPrJQk7qy8WM49+hZ9fTnlb38QLcZmWsRDH2ZqRctLiv/HtBY8YlvxCuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731877812; c=relaxed/simple;
	bh=VWjBlZ26MchQzz8fZi9aGEOX4tEJitUwSPEEfw6xwwE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oaJjtnlHkSwoAzxGYrlOT/wwbSPwNzAjoVXHFJZeZg5Hc7KK7p5uiMhlyQN4NYmHnVG57BdAqcpYLsbSRO6uo9360ien1xIOR0g4v6X2Rn3GK/xTiQTCGuZDmW8VGubRClHKkQuu0ME4rN27VDFLveLMQya+M5FAB0t6//vRIe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T+0H2TrV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T+0H2TrV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE331C4CECD;
	Sun, 17 Nov 2024 21:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731877812;
	bh=VWjBlZ26MchQzz8fZi9aGEOX4tEJitUwSPEEfw6xwwE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T+0H2TrV/a/43xrHl9e0Tr5hWwmh1OzMdRq1kRaId92EXFc9klgLUVWDAGj+GuvGZ
	 JtkX8llfQZVYABOEiAgT5xOuvRQte5kcazNwJqaLEPxf2M4WCyCH5AGTcNODwsumEl
	 oRs8s8rgkMrcmXAQtzXMzE3O+2kGHBn+33SNZuAXuek4BbmoEQerHorxOQ/zCx2Z9r
	 418L5tBDsTkheCwYYyPtyciJGfvK//5GmsFfmNIuAIWG52aRZBmg+WE09mjVJVZhge
	 J1+wPVcroKoVOp/rnKj2FOYIGWwxdbaPNIKP4NSxDk8g6OyeZksuWNBzpVKK8zf3H7
	 0+WnEMUQKm9Gg==
From: SeongJae Park <sj@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: SeongJae Park <sj@kernel.org>,
	llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [sj:damon/next 54/54] mm/damon/core.c:2027:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true
Date: Sun, 17 Nov 2024 13:10:08 -0800
Message-Id: <20241117211008.55104-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <202411180218.mUqglaqC-lkp@intel.com>
References: 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

On Mon, 18 Nov 2024 02:24:59 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
> head:   26e20409cfae740fa1111007c575241ef2b3baeb
> commit: 26e20409cfae740fa1111007c575241ef2b3baeb [54/54] mm/damon/core: simplify damon_call() callback path
> config: x86_64-rhel-8.3-kselftests (https://download.01.org/0day-ci/archive/20241118/202411180218.mUqglaqC-lkp@intel.com/config)
> compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241118/202411180218.mUqglaqC-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202411180218.mUqglaqC-lkp@intel.com/

Thank you for this nice report!  Just pushed a fix:
https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git/commit/?h=damon/next&id=beb3db106b44e3601fa019bf6173850c252c03a0


Thanks,
SJ

[...]
