Received: from mail.enpas.org (zhong.enpas.org [46.38.239.100])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CA88624
	for <llvm@lists.linux.dev>; Sat, 14 May 2022 11:25:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.enpas.org (Postfix) with ESMTPSA id A8421FF959;
	Sat, 14 May 2022 11:17:29 +0000 (UTC)
Date: Sat, 14 May 2022 13:17:26 +0200
From: Max Staudt <max@enpas.org>
To: Vincent MAILHOL <mailhol.vincent@wanadoo.fr>
Cc: kernel test robot <lkp@intel.com>, Marc Kleine-Budde
 <mkl@pengutronix.de>, llvm@lists.linux.dev, kbuild-all@lists.01.org,
 linux-can@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] can: skb:: move can_dropped_invalid_skb and
 can_skb_headroom_valid to skb.c
Message-ID: <20220514131726.55fbbcdb.max@enpas.org>
In-Reply-To: <CAMZ6RqLU-Wg0Cau3cM=QsU-t-7Lyzmo1nJ_VAA4Mbw3u0jnNtw@mail.gmail.com>
References: <20220513153606.302464-2-mailhol.vincent@wanadoo.fr>
	<202205141221.H0aZXRak-lkp@intel.com>
	<CAMZ6RqLU-Wg0Cau3cM=QsU-t-7Lyzmo1nJ_VAA4Mbw3u0jnNtw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 14 May 2022 14:16:09 +0900
Vincent MAILHOL <mailhol.vincent@wanadoo.fr> wrote:

> OK, so the issue is that VCAN and VXCAN are users of
> can_dropped_invalid_skb() but do not depend on CAN_DEV. Above error
> will appear if CONFIG_CAN_DEV is not set (or if CONFIG_V{,X}CAN is set
> to "yes" and CAN_DEV is set to "module").
> I see three choices here:
>   1. move can_dropped_invalid_skb() outside of drivers/net/can (i.e.
> move it somewhere in net/can).
>   2. split CAN_DEV into one additional sub module: CAN_SKB and add a
> dependency to it in VCAN and VXCAN.
>   3. Add a dependency to CAN_DEV in VCAN and VXCAN
> 
> 1. is I think the worse, 2. the best, 3. is the laziest option and is
> kind of acceptable.
> @Marc (and anyone else), what are your thoughts?

I think that having v(x)can depend on can-dev isn't half bad - for the
user, they are CAN devices, anyway, and modprobe does the dependency
resolution magic.

Splitting into too many modules is something I'd avoid because of the
overhead involved.



Max
