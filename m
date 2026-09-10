Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07324BE42F;
	Thu, 10 Sep 2026 16:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789056886; cv=none; b=NNFo0bWWPfklFtf4adpumtu6ltPLUwYkOlcnTBemLA26Rsgf2iwqvteddamSKtYkwHAZD/1XEKP+dXIlalSkP8s6XRN3v59gPdpF7eSeWYiZRDfbBYXUNvm935ciQbffoL4zoIWeyZ569pknY9kxb45YSgR/2TpR87QAil4IBg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789056886; c=relaxed/simple;
	bh=OfmapbnUVYlkRpvxl3+h0Ozo1zASVL/urlvzXYKq28g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VT0HIOC/fJ8Qh0Tvw8crUB/eqv70guEjC/3PdZWqIHIoAzW1vQR7wV2dLZMeJdR+3TBlo6iIe63kJmrl7oK10O+l7Y7qmVZEOlBb94tSg8VMct2KmPiFZ+J082xQ8UwfmyGBE53x1C0ymmKINy/if0YgkMM9xwvLrDGkyLTvBc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iYANjSJW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iYANjSJW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30A481F000FF;
	Thu, 10 Sep 2026 16:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789056884;
	bh=Fw6B6BDnI+WMh9QnXCNgKcYYIXhI7HChtVbbG3XvG40=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=iYANjSJWvsIrS6/lDhk29hhu/M9crvAt6CXkDvDIH7RBC3TNPipToZuBK6rlKyhmC
	 fFC/S2xUxbxQ3sM1BYMOP98+dzmblqHMcJKumwHJTpTTCL2olq17fj28VCWNVYyHI9
	 XDHoQweqogC8m/d/TBeytuhJV5eCxaolIf33kaSnBGUyOz3UdxnHM1BTr43TXVPxa9
	 L4JhOR/nwEREaVCTtt1DnZw4t+2+7pAmVwgufbFQieTT+CvxLzGGK+yTwQPsFtGNLc
	 Nr5YlP2CiUvUuoP39owVrDvjEexA1gn9zNqNaHH13piWd/SLqBECwplvxxtdpMMilZ
	 HkhPKzclPu55w==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id E5D83CE1580; Thu, 10 Sep 2026 09:14:43 -0700 (PDT)
Date: Thu, 10 Sep 2026 09:14:43 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [paulmck-rcu:dev.2026.09.03a 43/55]
 drivers/usb/mtu3/./mtu3_trace.h:239:27: error: cannot take the address of an
 rvalue of type 'dma_addr_t' (aka 'unsigned long long')
Message-ID: <2b62ec47-849f-4432-9cc2-08bd86e135a2@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202609101926.cc5w6bhk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202609101926.cc5w6bhk-lkp@intel.com>

On Thu, Sep 10, 2026 at 10:03:48PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev.2026.09.03a
> head:   6c5c244f4b239bc4d284e58a2f79a143648557cb
> commit: afda2321e6e93a5bcc28bfb4717fbc3a1768446c [43/55] EXP drivers/usb/mtu3: Work around mtu3_log_ep double-indirection issue
> config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260910/202609101926.cc5w6bhk-lkp@intel.com/config)
> compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project c1872e7fd3307679a2da53f9d83de0ccf234b4ad)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260910/202609101926.cc5w6bhk-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202609101926.cc5w6bhk-lkp@intel.com/

Good catch, but this has been reverted to the previous form.

Nevertheless, thank you for your testing efforts!

							Thanx, Paul

> Note: the paulmck-rcu/dev.2026.09.03a HEAD 6c5c244f4b239bc4d284e58a2f79a143648557cb builds fine.
>       It only hurts bisectability.
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from drivers/usb/mtu3/mtu3_trace.c:12:
>    In file included from drivers/usb/mtu3/mtu3_trace.h:279:
>    In file included from include/trace/define_trace.h:132:
>    In file included from include/trace/trace_events.h:489:
>    drivers/usb/mtu3/./mtu3_trace.h:239:41: error: member reference type 'struct mtu3_gpd_ring' is not a pointer; did you mean to use '.'?
>      239 |                 __entry->gpd_ring_dma = &mep->gpd_ring->dma;
>          |                                          ~~~~~~~~~~~~~^~
>          |                                                       .
>    include/trace/stages/stage6_event_callback.h:133:33: note: expanded from macro 'TP_fast_assign'
>      133 | #define TP_fast_assign(args...) args
>          |                                 ^~~~
>    include/trace/trace_events.h:456:16: note: expanded from macro 'DECLARE_EVENT_CLASS'
>      456 |                       PARAMS(assign), PARAMS(print))                    \
>          |                              ^~~~~~
>    include/linux/tracepoint.h:161:25: note: expanded from macro 'PARAMS'
>      161 | #define PARAMS(args...) args
>          |                         ^~~~
>    include/trace/trace_events.h:448:4: note: expanded from macro '\
>    __DECLARE_EVENT_CLASS'
>      448 |         { assign; }                                                     \
>          |           ^~~~~~
>    In file included from drivers/usb/mtu3/mtu3_trace.c:12:
>    In file included from drivers/usb/mtu3/mtu3_trace.h:279:
>    In file included from include/trace/define_trace.h:132:
>    In file included from include/trace/trace_events.h:489:
> >> drivers/usb/mtu3/./mtu3_trace.h:239:27: error: cannot take the address of an rvalue of type 'dma_addr_t' (aka 'unsigned long long')
>      239 |                 __entry->gpd_ring_dma = &mep->gpd_ring->dma;
>          |                                         ^~~~~~~~~~~~~~~~~~~
>    include/trace/stages/stage6_event_callback.h:133:33: note: expanded from macro 'TP_fast_assign'
>      133 | #define TP_fast_assign(args...) args
>          |                                 ^~~~
>    include/trace/trace_events.h:456:16: note: expanded from macro 'DECLARE_EVENT_CLASS'
>      456 |                       PARAMS(assign), PARAMS(print))                    \
>          |                              ^~~~~~
>    include/linux/tracepoint.h:161:25: note: expanded from macro 'PARAMS'
>      161 | #define PARAMS(args...) args
>          |                         ^~~~
>    include/trace/trace_events.h:448:4: note: expanded from macro '\
>    __DECLARE_EVENT_CLASS'
>      448 |         { assign; }                                                     \
>          |           ^~~~~~
>    In file included from drivers/usb/mtu3/mtu3_trace.c:12:
>    In file included from drivers/usb/mtu3/mtu3_trace.h:279:
>    In file included from include/trace/define_trace.h:133:
>    In file included from include/trace/perf.h:110:
>    drivers/usb/mtu3/./mtu3_trace.h:239:41: error: member reference type 'struct mtu3_gpd_ring' is not a pointer; did you mean to use '.'?
>      239 |                 __entry->gpd_ring_dma = &mep->gpd_ring->dma;
>          |                                          ~~~~~~~~~~~~~^~
>          |                                                       .
>    include/trace/stages/stage6_event_callback.h:133:33: note: expanded from macro 'TP_fast_assign'
>      133 | #define TP_fast_assign(args...) args
>          |                                 ^~~~
>    include/trace/perf.h:67:16: note: expanded from macro 'DECLARE_EVENT_CLASS'
>       67 |                       PARAMS(assign), PARAMS(print))                    \
>          |                              ^~~~~~
>    include/linux/tracepoint.h:161:25: note: expanded from macro 'PARAMS'
>      161 | #define PARAMS(args...) args
>          |                         ^~~~
>    include/trace/perf.h:51:4: note: expanded from macro '\
>    __DECLARE_EVENT_CLASS'
>       51 |         { assign; }                                                     \
>          |           ^~~~~~
>    In file included from drivers/usb/mtu3/mtu3_trace.c:12:
>    In file included from drivers/usb/mtu3/mtu3_trace.h:279:
>    In file included from include/trace/define_trace.h:133:
>    In file included from include/trace/perf.h:110:
> >> drivers/usb/mtu3/./mtu3_trace.h:239:27: error: cannot take the address of an rvalue of type 'dma_addr_t' (aka 'unsigned long long')
>      239 |                 __entry->gpd_ring_dma = &mep->gpd_ring->dma;
>          |                                         ^~~~~~~~~~~~~~~~~~~
>    include/trace/stages/stage6_event_callback.h:133:33: note: expanded from macro 'TP_fast_assign'
>      133 | #define TP_fast_assign(args...) args
>          |                                 ^~~~
>    include/trace/perf.h:67:16: note: expanded from macro 'DECLARE_EVENT_CLASS'
>       67 |                       PARAMS(assign), PARAMS(print))                    \
>          |                              ^~~~~~
>    include/linux/tracepoint.h:161:25: note: expanded from macro 'PARAMS'
>      161 | #define PARAMS(args...) args
>          |                         ^~~~
>    include/trace/perf.h:51:4: note: expanded from macro '\
>    __DECLARE_EVENT_CLASS'
>       51 |         { assign; }                                                     \
>          |           ^~~~~~
>    4 errors generated.
> 
> 
> vim +239 drivers/usb/mtu3/./mtu3_trace.h
> 
>    213	
>    214	DECLARE_EVENT_CLASS(mtu3_log_ep,
>    215		TP_PROTO(struct mtu3_ep *mep),
>    216		TP_ARGS(mep),
>    217		TP_STRUCT__entry(
>    218			__string(name, mep->name)
>    219			__field(unsigned int, type)
>    220			__field(unsigned int, slot)
>    221			__field(unsigned int, maxp)
>    222			__field(unsigned int, mult)
>    223			__field(unsigned int, maxburst)
>    224			__field(unsigned int, flags)
>    225			__field(unsigned int, direction)
>    226			__field(struct mtu3_gpd_ring *, gpd_ring)
>    227			__field(dma_addr_t *, gpd_ring_dma)
>    228		),
>    229		TP_fast_assign(
>    230			__assign_str(name);
>    231			__entry->type = mep->type;
>    232			__entry->slot = mep->slot;
>    233			__entry->maxp = mep->ep.maxpacket;
>    234			__entry->mult = mep->ep.mult;
>    235			__entry->maxburst = mep->ep.maxburst;
>    236			__entry->flags = mep->flags;
>    237			__entry->direction = mep->is_in;
>    238			__entry->gpd_ring = &mep->gpd_ring;
>  > 239			__entry->gpd_ring_dma = &mep->gpd_ring->dma;
>    240		),
>    241		TP_printk("%s: type %s maxp %d slot %d mult %d burst %d ring %p/%pad flags %c:%c%c%c:%c",
>    242			__get_str(name), usb_ep_type_string(__entry->type),
>    243			__entry->maxp, __entry->slot,
>    244			__entry->mult, __entry->maxburst,
>    245			__entry->gpd_ring, __entry->gpd_ring_dma,
>    246			__entry->flags & MTU3_EP_ENABLED ? 'E' : 'e',
>    247			__entry->flags & MTU3_EP_STALL ? 'S' : 's',
>    248			__entry->flags & MTU3_EP_WEDGE ? 'W' : 'w',
>    249			__entry->flags & MTU3_EP_BUSY ? 'B' : 'b',
>    250			__entry->direction ? '<' : '>'
>    251		)
>    252	);
>    253	
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
