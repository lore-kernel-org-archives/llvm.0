Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F172D61B;
	Wed, 17 Jul 2024 14:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721225958; cv=none; b=eGfGnJ4A39dYoWtU/GwfL3N9BKOpT1Oj7eq2WuJtCrYMG3fTj2ERQDwqZ8vRplzTSzGpGDSaA7Ss21EdWETx8ZpiPZ9IBwoYSKU+GFwkTlRwHH5gUxdxHGFAnfSWsOgEVl4v/MQxxH4riAj8oWp9DwKvORKiOoxRIWLuLMLLNGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721225958; c=relaxed/simple;
	bh=whRvstRl9rLHP+Nc075ej4DXJaL5h9V4250V4vcqsQo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uWMwD8gMNQX2FEXYjEvMvHT/dA0NPrra6OsAzKTGVB21FXg5SKx1k9eeXrt30/Gx/wecDC8KtyKExHQWXLMOJf7VSc4JAilZVWN6BU5tNOrU7sX8Xdd6puOawiy6HsmMXJux4ngc+swiKIJ4/25Kkvc4pibsAwHZTfetjwG+eJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pYgonnO2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pYgonnO2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FA70C2BD10;
	Wed, 17 Jul 2024 14:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721225958;
	bh=whRvstRl9rLHP+Nc075ej4DXJaL5h9V4250V4vcqsQo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pYgonnO2ANmPX13Wfffz6DCJjNgcs7xK4zCi1KetdNA8yrl+d8qQBlRFEUM/PHAmS
	 NWBy0eiIuSQ7SgPC5kPyAbghQcDMgYcMgEZcQBrDgrB1H4ypAl7IEI+Km1unX7zXXc
	 5BnNvGgiQKUDdB/JrQ6D2GSjv/MArIiBe4y+Th8OfA2ywrgKV1OOWu0DXubzB7jfej
	 ibNCL6E3aNj3zc2y/8kE62CEk42XAN1KV+VDbKyngp8QAscqbGGldQ/q/M1yFZM9UB
	 b7L38wvh8jNYyqNZFYqjCGBOxC6maG7pC0nz6DuWhW6OBYqUiP10TU8cX4/S+J26TS
	 K7JGp1yHDMWXA==
Date: Wed, 17 Jul 2024 07:19:16 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: kernel test robot <lkp@intel.com>, Alexander Duyck
 <alexanderduyck@fb.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>
Subject: Re: [linux-next:master 12947/13217]
 drivers/net/ethernet/meta/fbnic/fbnic_txrx.c:1088:6: error: call to
 '__compiletime_assert_749' declared with 'error' attribute: FIELD_PREP:
 value too large for the field
Message-ID: <20240717071916.01b6fe16@kernel.org>
In-Reply-To: <20240717013254.GA683176@thelio-3990X>
References: <202407170432.dYJQOWVz-lkp@intel.com>
	<20240717013254.GA683176@thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 16 Jul 2024 18:32:54 -0700 Nathan Chancellor wrote:
> FWIW, this does not appear to be clang specific, it reproduces with GCC
> as well:

Thanks for the analysis and sorry for the breakage.
It's fixed in net.git now. We'll ship the fix to Linus on Friday 
(LMK if its more urgent than that).
