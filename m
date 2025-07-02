Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88FF2FC3CB;
	Wed,  2 Jul 2025 21:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751492240; cv=none; b=E3SoOBHyueN1G2zIAR6RUmZXD9YYlrz+WsHOw79+pE1fYebTollbceP3QcabIoMoPNNnZMvZv21oit5WV3FnFFgJEipSHxWDOof/Trcz3j2eS8nCEylnyiUS25lfcSDWAB9aeGeYtWN9zF97A6BqjkU+jcu2ER9lZ/iz2WdjphU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751492240; c=relaxed/simple;
	bh=9Duv1PhYYD4NNf63YbytF4YVXx7xBg8V0vJB/Fag92s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pKdZw4uoOdeExX5IBKH0gHSOhOv5PezEhrkf7xz6szFPDt/FePLBpfMLFxWTAJapSMfgXbZaADeBEJ6gOF9MUi289B7T0Tl0GM/BHgaTt+s1sHFC9yMLh5r1xI7WjDj4JvQya5snR/ukhvZH5NxQw+4ZSWRekgaUNg5ETDg9sjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PFEVaWCJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PFEVaWCJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E9A2C4CEF1;
	Wed,  2 Jul 2025 21:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751492240;
	bh=9Duv1PhYYD4NNf63YbytF4YVXx7xBg8V0vJB/Fag92s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PFEVaWCJtiEhz+YfbcLfnPX4c2/G/wM2vh/fLgk+WY1kyM3oxA+DU1voptgS8Ji7U
	 skDQN4xY4O44dXpjmebx3u7omgfPB8IRViWhOC9qNvRpZw1jH6/nOunNeSFOIbgBQF
	 lHkHkWaKZR/SklbWjg0/pYP7jRMb/Os+OZvir9YUoCpa8NggBc95ftEeMf738+vEr4
	 2plGli22vnYSIJXcDBpMezN2Njrd/Z7NuVoG/fiIhxoyuGbnLjE5/1Purg3UG5wOmk
	 XbKQSl2/qHUHIJkky3w8/HcseEA/aPeZvY1mI7KDA6gKZr/uVmmWtM61cbE9HrEEQi
	 Hk7JwTgJVvBdw==
Date: Wed, 2 Jul 2025 14:37:16 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, Stephen Boyd <swboyd@chromium.org>
Subject: Re: [linux-next:master 3022/4739] drivers/gpu/drm/msm/msm.o:
 warning: objtool: msm_dp_ctrl_on_stream(): unexpected end of section
 .text.msm_dp_ctrl_on_stream
Message-ID: <20250702213716.GA2103156@ax162>
References: <202506251051.7rmus46j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202506251051.7rmus46j-lkp@intel.com>

On Wed, Jun 25, 2025 at 10:16:55AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   2ae2aaafb21454f4781c30734959cf223ab486ef
> commit: 8583a655f2c2bb442e2a2668680f419aa4c511d1 [3022/4739] drm/msm/dp: move/inline ctrl register functions
> config: x86_64-buildonly-randconfig-005-20250625 (https://download.01.org/0day-ci/archive/20250625/202506251051.7rmus46j-lkp@intel.com/config)
> compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250625/202506251051.7rmus46j-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202506251051.7rmus46j-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> drivers/gpu/drm/msm/msm.o: warning: objtool: msm_dp_ctrl_on_stream(): unexpected end of section .text.msm_dp_ctrl_on_stream

This appears to be a case similar to [1] and [2], where clang has been
able to figure out that there will be a divide by zero in the else
branch of msm_dp_ctrl_config_msa(). Should pixel_div be adjusted to 1 or
should the divide by zero be avoided by returning early? I believe Bill
is still looking into trying to make this less distructive in LLVM but
it should still probably be fixed for LLVM 20, which is already
released.

[1]: https://lore.kernel.org/CAHk-=wiq=E0fwJLFpCc3wPY_9BPZF3dbdqGgVoOmK9Ykj5JEeg@mail.gmail.com/
[2]: https://lore.kernel.org/20250609213505.GA1634981@ax162/

Cheers,
Nathan
