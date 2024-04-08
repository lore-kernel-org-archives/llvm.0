Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68C42D781;
	Mon,  8 Apr 2024 23:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712617600; cv=none; b=b6r4BLIKlERAs657ycVeS6j9fTzqWuoyC7dKEOElivlqW4M9pDtNSnoNE6h4Ml2aGrcyHMJQj/5NPIMyfUW7BJu1RHJ3VdViskzCnK4T/Tc+WV1DHOxaUXBsEQYgHO6s4EDTw6w6eyX63D4hiqa5dZE5SWgMEF2Xxe/EBk4946M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712617600; c=relaxed/simple;
	bh=2nqT8r9MRUeDkaoHQotzGqXNji9hcmkP+IbGIBIVn8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bPKJ8P6E2fga1gjKO/pmXuPfMzIQ7XY8VLUPhxTStBSdro/adpoIvG5CFU0Vsy51+zSl6vWMMvMffokf4cIjwEBq+g7AzmNz32/qNYni4qls/k4hmbtaMWpMcj1JM9XjueMkk6mnkD3XDJDjicfkxCeAkN/Ts8gwQpMiTGa9r8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kCzBEsU1; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kCzBEsU1"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-41551639550so34992745e9.2;
        Mon, 08 Apr 2024 16:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712617596; x=1713222396; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cL7KaZHwNOsNwrP5VkwfgrZ0oTyftn93Uu1wttIm/Vg=;
        b=kCzBEsU16sgA+F12RIWwaZU+aOOQNz1Qjw7BoygTaWhd5EOdhEA9CNZrK8u9irxwvo
         HKFkMktu+FSGr7XKSPpa3Sr0rlgAi+pGs6tnyKofxp1WCpj3XZBTKiProol1sOhfixrh
         JrvV9fUuDplsv3PNJJaQcPRuon0axTAA/pdorDNbGTbE3SHX4Fdmq+wlLgYPn1XoCx8P
         UrZ+hkhrLu46sY3TCUqWfxN/Z5wxnvHg7RalJCDO4DwG5/idNC6rGDfcOOxBItJVlhcI
         df9FzvjCLM2NyVWC4Qb/VI2tHEhpVfFYdoBUGaiXyUSVRRBwD5koiHMEeEr73frEO64d
         b3FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712617596; x=1713222396;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cL7KaZHwNOsNwrP5VkwfgrZ0oTyftn93Uu1wttIm/Vg=;
        b=bQO5MWOBCuI9UP0va+F7rskdDcaaitPHCFNF6iLC2odQJ4AUqdiH81QIG8meq+mQin
         gE/u+R6VyJkxahEyCpiTN8QaYQYR7ly0yTdUaYz4kCdUzLZ6wibFYLIllmJVjUFcZTlB
         jJuPbsTfHTaTJ0RHiCz8B6mqeqIuDppC7z/n5Z/x4gyQvJOFGnoB2Ckje4/zEuBUertK
         /eQiZgEYzBlJpVK3QVYBbbYCm7oJR8Rq+KX5uuXXRbEiWeqRWdZq5vDs3Ab6hBDPxSJM
         Bs05uLdw4Uk8nSPKUgwyXzpTQ2ltiwq3vFG6TvCVwQfC3qf2xKa1YPzJthz7UPG1bdjH
         ppbA==
X-Forwarded-Encrypted: i=1; AJvYcCWVeZZqcTj65ylzpMX/mb65ZrHmXFBb4oqzIl1OznlpOoK2o4NsZDyqbK8isSwGhLFpFk6L1sPn65gtLVJlKSv/05CRNO94xdrSe4KHrhGkQukGEILtSsd/+2Ocex/UMC140yo=
X-Gm-Message-State: AOJu0Yx0UH4lJZpi+nuaAUtNPGQR+1ePiGUMTuP4mh5w9EpdEZEZTxaQ
	jhDlqrIYhhI8KTTJbY45kv2dUnNkSDVemyx0IjvhRg2ay304ap//
X-Google-Smtp-Source: AGHT+IFCt5R3Le2GQT2liPmUWp4ksG3+tMG8Gfc5G+0g9sXIZ7r4L9fKIjqpp/Qy9HVe0I86hjF19A==
X-Received: by 2002:a05:600c:1f0a:b0:416:3762:cea0 with SMTP id bd10-20020a05600c1f0a00b004163762cea0mr5810580wmb.13.1712617595545;
        Mon, 08 Apr 2024 16:06:35 -0700 (PDT)
Received: from skbuf ([2a02:2f04:d201:1f00::b2c])
        by smtp.gmail.com with ESMTPSA id n9-20020a05600c500900b00416a19403f3sm619331wmr.0.2024.04.08.16.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 16:06:34 -0700 (PDT)
Date: Tue, 9 Apr 2024 02:06:32 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Eric Dumazet <edumazet@google.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org
Subject: Re: [net-next:main 26/50] net/ipv4/tcp.c:4673:2: error: call to
 '__compiletime_assert_1030' declared with 'error' attribute: BUILD_BUG_ON
 failed: offsetof(struct tcp_sock,
 __cacheline_group_end__tcp_sock_write_txrx) - offsetofend(struct tcp_sock,
 __cacheline_group_begin__tcp_sock_...
Message-ID: <20240408230632.5ml3amaztr5soyfs@skbuf>
References: <202404082207.HCEdQhUO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202404082207.HCEdQhUO-lkp@intel.com>

Hi Eric,

On Mon, Apr 08, 2024 at 10:49:35PM +0800, kernel test robot wrote:
> >> net/ipv4/tcp.c:4673:2: error: call to '__compiletime_assert_1030' declared with 'error' attribute: BUILD_BUG_ON failed: offsetof(struct tcp_sock, __cacheline_group_end__tcp_sock_write_txrx) - offsetofend(struct tcp_sock, __cacheline_group_begin__tcp_sock_write_txrx) > 92
> > 4673		CACHELINE_ASSERT_GROUP_SIZE(struct tcp_sock, tcp_sock_write_txrx, 92);

I can confirm the same compile time assertion with an armv7 gcc 7.3.1 compiler.
If I revert commit 86dad9aebd0d ("Revert "tcp: more struct tcp_sock adjustments")
it goes away.

Before the change (actually with it reverted), I can see that the
tcp_sock_write_txrx cacheline group begins at offset 1821 with a 3 byte
hole, and ends at offset 1897 (it has 76 bytes).

$ pahole -C tcp_sock $KBUILD_OUTPUT/net/ipv4/tcp.o
struct tcp_sock {
	struct inet_connection_sock inet_conn __attribute__((__aligned__(8))); /*     0  1568 */
	/* --- cacheline 24 boundary (1536 bytes) was 32 bytes ago --- */
	__u8                       __cacheline_group_begin__tcp_sock_read_tx[0]; /*  1568     0 */
	u32                        max_window;           /*  1568     4 */
	u32                        rcv_ssthresh;         /*  1572     4 */
	u32                        reordering;           /*  1576     4 */
	u32                        notsent_lowat;        /*  1580     4 */
	u16                        gso_segs;             /*  1584     2 */

	/* XXX 2 bytes hole, try to pack */

	struct sk_buff *           lost_skb_hint;        /*  1588     4 */
	struct sk_buff *           retransmit_skb_hint;  /*  1592     4 */
	__u8                       __cacheline_group_end__tcp_sock_read_tx[0]; /*  1596     0 */
	__u8                       __cacheline_group_begin__tcp_sock_read_txrx[0]; /*  1596     0 */
	u32                        tsoffset;             /*  1596     4 */
	/* --- cacheline 25 boundary (1600 bytes) --- */
	u32                        snd_wnd;              /*  1600     4 */
	u32                        mss_cache;            /*  1604     4 */
	u32                        snd_cwnd;             /*  1608     4 */
	u32                        prr_out;              /*  1612     4 */
	u32                        lost_out;             /*  1616     4 */
	u32                        sacked_out;           /*  1620     4 */
	u16                        tcp_header_len;       /*  1624     2 */
	u8                         scaling_ratio;        /*  1626     1 */
	u8                         chrono_type:2;        /*  1627: 0  1 */
	u8                         repair:1;             /*  1627: 2  1 */
	u8                         tcp_usec_ts:1;        /*  1627: 3  1 */
	u8                         is_sack_reneg:1;      /*  1627: 4  1 */
	u8                         is_cwnd_limited:1;    /*  1627: 5  1 */

	/* XXX 2 bits hole, try to pack */

	__u8                       __cacheline_group_end__tcp_sock_read_txrx[0]; /*  1628     0 */
	__u8                       __cacheline_group_begin__tcp_sock_read_rx[0]; /*  1628     0 */
	u32                        copied_seq;           /*  1628     4 */
	u32                        rcv_tstamp;           /*  1632     4 */
	u32                        snd_wl1;              /*  1636     4 */
	u32                        tlp_high_seq;         /*  1640     4 */
	u32                        rttvar_us;            /*  1644     4 */
	u32                        retrans_out;          /*  1648     4 */
	u16                        advmss;               /*  1652     2 */
	u16                        urg_data;             /*  1654     2 */
	u32                        lost;                 /*  1656     4 */
	struct minmax              rtt_min;              /*  1660    24 */
	/* --- cacheline 26 boundary (1664 bytes) was 20 bytes ago --- */
	struct rb_root             out_of_order_queue;   /*  1684     4 */
	u32                        snd_ssthresh;         /*  1688     4 */
	__u8                       __cacheline_group_end__tcp_sock_read_rx[0]; /*  1692     0 */

	/* XXX 36 bytes hole, try to pack */

	/* --- cacheline 27 boundary (1728 bytes) --- */
	__u8                       __cacheline_group_begin__tcp_sock_write_tx[0] __attribute__((__aligned__(64))); /*  1728     0 */
	u32                        segs_out;             /*  1728     4 */
	u32                        data_segs_out;        /*  1732     4 */
	u64                        bytes_sent;           /*  1736     8 */
	u32                        snd_sml;              /*  1744     4 */
	u32                        chrono_start;         /*  1748     4 */
	u32                        chrono_stat[3];       /*  1752    12 */
	u32                        write_seq;            /*  1764     4 */
	u32                        pushed_seq;           /*  1768     4 */
	u32                        lsndtime;             /*  1772     4 */
	u32                        mdev_us;              /*  1776     4 */
	u32                        rtt_seq;              /*  1780     4 */
	u64                        tcp_wstamp_ns;        /*  1784     8 */
	/* --- cacheline 28 boundary (1792 bytes) --- */
	u64                        tcp_clock_cache;      /*  1792     8 */
	u64                        tcp_mstamp;           /*  1800     8 */
	struct list_head           tsorted_sent_queue;   /*  1808     8 */
	struct sk_buff *           highest_sack;         /*  1816     4 */
	u8                         ecn_flags;            /*  1820     1 */
	__u8                       __cacheline_group_end__tcp_sock_write_tx[0]; /*  1821     0 */
	__u8                       __cacheline_group_begin__tcp_sock_write_txrx[0]; /*  1821     0 */

	/* XXX 3 bytes hole, try to pack */

	__be32                     pred_flags;           /*  1824     4 */
	u32                        rcv_nxt;              /*  1828     4 */
	u32                        snd_nxt;              /*  1832     4 */
	u32                        snd_una;              /*  1836     4 */
	u32                        window_clamp;         /*  1840     4 */
	u32                        srtt_us;              /*  1844     4 */
	u32                        packets_out;          /*  1848     4 */
	u32                        snd_up;               /*  1852     4 */
	/* --- cacheline 29 boundary (1856 bytes) --- */
	u32                        delivered;            /*  1856     4 */
	u32                        delivered_ce;         /*  1860     4 */
	u32                        app_limited;          /*  1864     4 */
	u32                        rcv_wnd;              /*  1868     4 */
	struct tcp_options_received rx_opt;              /*  1872    24 */
	u8                         nonagle:4;            /*  1896: 0  1 */
	u8                         rate_app_limited:1;   /*  1896: 4  1 */

	/* XXX 3 bits hole, try to pack */

	__u8                       __cacheline_group_end__tcp_sock_write_txrx[0]; /*  1897     0 */

	/* XXX 7 bytes hole, try to pack */

	__u8                       __cacheline_group_begin__tcp_sock_write_rx[0] __attribute__((__aligned__(8))); /*  1904     0 */
	u64                        bytes_received;       /*  1904     8 */
	u32                        segs_in;              /*  1912     4 */
	u32                        data_segs_in;         /*  1916     4 */
	/* --- cacheline 30 boundary (1920 bytes) --- */
	u32                        rcv_wup;              /*  1920     4 */
	u32                        max_packets_out;      /*  1924     4 */
	u32                        cwnd_usage_seq;       /*  1928     4 */
	u32                        rate_delivered;       /*  1932     4 */
	u32                        rate_interval_us;     /*  1936     4 */
	u32                        rcv_rtt_last_tsecr;   /*  1940     4 */
	u64                        first_tx_mstamp;      /*  1944     8 */
	u64                        delivered_mstamp;     /*  1952     8 */
	u64                        bytes_acked;          /*  1960     8 */
	struct {
		u32                rtt_us;               /*  1968     4 */
		u32                seq;                  /*  1972     4 */
		u64                time;                 /*  1976     8 */
	} rcv_rtt_est;                                   /*  1968    16 */
	/* --- cacheline 31 boundary (1984 bytes) --- */
	struct {
		u32                space;                /*  1984     4 */
		u32                seq;                  /*  1988     4 */
		u64                time;                 /*  1992     8 */
	} rcvq_space;                                    /*  1984    16 */
	__u8                       __cacheline_group_end__tcp_sock_write_rx[0]; /*  2000     0 */
	u32                        dsack_dups;           /*  2000     4 */
	u32                        compressed_ack_rcv_nxt; /*  2004     4 */
	struct list_head           tsq_node;             /*  2008     8 */
	struct tcp_rack            rack;                 /*  2016    24 */

	/* XXX last struct has 2 bytes of padding */

	u8                         compressed_ack;       /*  2040     1 */
	u8                         dup_ack_counter:2;    /*  2041: 0  1 */
	u8                         tlp_retrans:1;        /*  2041: 2  1 */
	u8                         unused:5;             /*  2041: 3  1 */
	u8                         thin_lto:1;           /*  2042: 0  1 */
	u8                         recvmsg_inq:1;        /*  2042: 1  1 */
	u8                         fastopen_connect:1;   /*  2042: 2  1 */
	u8                         fastopen_no_cookie:1; /*  2042: 3  1 */
	u8                         fastopen_client_fail:2; /*  2042: 4  1 */
	u8                         frto:1;               /*  2042: 6  1 */

	/* XXX 1 bit hole, try to pack */

	u8                         repair_queue;         /*  2043     1 */
	u8                         save_syn:2;           /*  2044: 0  1 */
	u8                         syn_data:1;           /*  2044: 2  1 */
	u8                         syn_fastopen:1;       /*  2044: 3  1 */
	u8                         syn_fastopen_exp:1;   /*  2044: 4  1 */
	u8                         syn_fastopen_ch:1;    /*  2044: 5  1 */
	u8                         syn_data_acked:1;     /*  2044: 6  1 */

	/* XXX 1 bit hole, try to pack */

	u8                         keepalive_probes;     /*  2045     1 */

	/* XXX 2 bytes hole, try to pack */

	/* --- cacheline 32 boundary (2048 bytes) --- */
	u32                        tcp_tx_delay;         /*  2048     4 */
	u32                        mdev_max_us;          /*  2052     4 */
	u32                        reord_seen;           /*  2056     4 */
	u32                        snd_cwnd_cnt;         /*  2060     4 */
	u32                        snd_cwnd_clamp;       /*  2064     4 */
	u32                        snd_cwnd_used;        /*  2068     4 */
	u32                        snd_cwnd_stamp;       /*  2072     4 */
	u32                        prior_cwnd;           /*  2076     4 */
	u32                        prr_delivered;        /*  2080     4 */
	u32                        last_oow_ack_time;    /*  2084     4 */
	struct hrtimer             pacing_timer __attribute__((__aligned__(8))); /*  2088    48 */

	/* XXX last struct has 4 bytes of padding */

	/* --- cacheline 33 boundary (2112 bytes) was 24 bytes ago --- */
	struct hrtimer             compressed_ack_timer __attribute__((__aligned__(8))); /*  2136    48 */

	/* XXX last struct has 4 bytes of padding */

	/* --- cacheline 34 boundary (2176 bytes) was 8 bytes ago --- */
	struct sk_buff *           ooo_last_skb;         /*  2184     4 */
	struct tcp_sack_block      duplicate_sack[1];    /*  2188     8 */
	struct tcp_sack_block      selective_acks[4];    /*  2196    32 */
	struct tcp_sack_block      recv_sack_cache[4];   /*  2228    32 */
	/* --- cacheline 35 boundary (2240 bytes) was 20 bytes ago --- */
	int                        lost_cnt_hint;        /*  2260     4 */
	u32                        prior_ssthresh;       /*  2264     4 */
	u32                        high_seq;             /*  2268     4 */
	u32                        retrans_stamp;        /*  2272     4 */
	u32                        undo_marker;          /*  2276     4 */
	int                        undo_retrans;         /*  2280     4 */

	/* XXX 4 bytes hole, try to pack */

	u64                        bytes_retrans;        /*  2288     8 */
	u32                        total_retrans;        /*  2296     4 */
	u32                        rto_stamp;            /*  2300     4 */
	/* --- cacheline 36 boundary (2304 bytes) --- */
	u16                        total_rto;            /*  2304     2 */
	u16                        total_rto_recoveries; /*  2306     2 */
	u32                        total_rto_time;       /*  2308     4 */
	u32                        urg_seq;              /*  2312     4 */
	unsigned int               keepalive_time;       /*  2316     4 */
	unsigned int               keepalive_intvl;      /*  2320     4 */
	int                        linger2;              /*  2324     4 */
	u8                         bpf_sock_ops_cb_flags; /*  2328     1 */
	u8                         bpf_chg_cc_inprogress:1; /*  2329: 0  1 */

	/* XXX 7 bits hole, try to pack */

	u16                        timeout_rehash;       /*  2330     2 */
	u32                        rcv_ooopack;          /*  2332     4 */
	struct {
		u32                probe_seq_start;      /*  2336     4 */
		u32                probe_seq_end;        /*  2340     4 */
	} mtu_probe;                                     /*  2336     8 */
	u32                        plb_rehash;           /*  2344     4 */
	u32                        mtu_info;             /*  2348     4 */
	struct tcp_fastopen_request * fastopen_req;      /*  2352     4 */
	struct request_sock *      fastopen_rsk;         /*  2356     4 */
	struct saved_syn *         saved_syn;            /*  2360     4 */

	/* size: 2368, cachelines: 37, members: 156 */
	/* sum members: 2304, holes: 6, sum holes: 54 */
	/* sum bitfield members: 34 bits, bit holes: 5, sum bit holes: 14 bits */
	/* padding: 4 */
	/* paddings: 3, sum paddings: 10 */
	/* forced alignments: 5, forced holes: 2, sum forced holes: 43 */
} __attribute__((__aligned__(64)));

After the change, it begins at 1805 and ends at 1901, thus triggering
the assertion (96 > 92):

struct tcp_sock {
	struct inet_connection_sock inet_conn __attribute__((__aligned__(8))); /*     0  1568 */
	/* --- cacheline 24 boundary (1536 bytes) was 32 bytes ago --- */
	__u8                       __cacheline_group_begin__tcp_sock_read_tx[0]; /*  1568     0 */
	u32                        max_window;           /*  1568     4 */
	u32                        rcv_ssthresh;         /*  1572     4 */
	u32                        reordering;           /*  1576     4 */
	u32                        notsent_lowat;        /*  1580     4 */
	u16                        gso_segs;             /*  1584     2 */

	/* XXX 2 bytes hole, try to pack */

	struct sk_buff *           lost_skb_hint;        /*  1588     4 */
	struct sk_buff *           retransmit_skb_hint;  /*  1592     4 */
	__u8                       __cacheline_group_end__tcp_sock_read_tx[0]; /*  1596     0 */
	__u8                       __cacheline_group_begin__tcp_sock_read_txrx[0]; /*  1596     0 */
	u32                        tsoffset;             /*  1596     4 */
	/* --- cacheline 25 boundary (1600 bytes) --- */
	u32                        snd_wnd;              /*  1600     4 */
	u32                        mss_cache;            /*  1604     4 */
	u32                        snd_cwnd;             /*  1608     4 */
	u32                        prr_out;              /*  1612     4 */
	u32                        lost_out;             /*  1616     4 */
	u32                        sacked_out;           /*  1620     4 */
	u16                        tcp_header_len;       /*  1624     2 */
	u8                         scaling_ratio;        /*  1626     1 */
	u8                         chrono_type:2;        /*  1627: 0  1 */
	u8                         repair:1;             /*  1627: 2  1 */
	u8                         tcp_usec_ts:1;        /*  1627: 3  1 */
	u8                         is_sack_reneg:1;      /*  1627: 4  1 */
	u8                         is_cwnd_limited:1;    /*  1627: 5  1 */

	/* XXX 2 bits hole, try to pack */

	__u8                       __cacheline_group_end__tcp_sock_read_txrx[0]; /*  1628     0 */
	__u8                       __cacheline_group_begin__tcp_sock_read_rx[0]; /*  1628     0 */
	u32                        copied_seq;           /*  1628     4 */
	u32                        rcv_tstamp;           /*  1632     4 */
	u32                        snd_wl1;              /*  1636     4 */
	u32                        tlp_high_seq;         /*  1640     4 */
	u32                        rttvar_us;            /*  1644     4 */
	u32                        retrans_out;          /*  1648     4 */
	u16                        advmss;               /*  1652     2 */
	u16                        urg_data;             /*  1654     2 */
	u32                        lost;                 /*  1656     4 */
	struct minmax              rtt_min;              /*  1660    24 */
	/* --- cacheline 26 boundary (1664 bytes) was 20 bytes ago --- */
	struct rb_root             out_of_order_queue;   /*  1684     4 */
	u32                        snd_ssthresh;         /*  1688     4 */
	u8                         recvmsg_inq:1;        /*  1692: 0  1 */

	/* XXX 7 bits hole, try to pack */

	__u8                       __cacheline_group_end__tcp_sock_read_rx[0]; /*  1693     0 */

	/* XXX 35 bytes hole, try to pack */

	/* --- cacheline 27 boundary (1728 bytes) --- */
	__u8                       __cacheline_group_begin__tcp_sock_write_tx[0] __attribute__((__aligned__(64))); /*  1728     0 */
	u32                        segs_out;             /*  1728     4 */
	u32                        data_segs_out;        /*  1732     4 */
	u64                        bytes_sent;           /*  1736     8 */
	u32                        snd_sml;              /*  1744     4 */
	u32                        chrono_start;         /*  1748     4 */
	u32                        chrono_stat[3];       /*  1752    12 */
	u32                        write_seq;            /*  1764     4 */
	u32                        pushed_seq;           /*  1768     4 */
	u32                        lsndtime;             /*  1772     4 */
	u32                        mdev_us;              /*  1776     4 */
	u32                        rtt_seq;              /*  1780     4 */
	u64                        tcp_wstamp_ns;        /*  1784     8 */
	/* --- cacheline 28 boundary (1792 bytes) --- */
	struct list_head           tsorted_sent_queue;   /*  1792     8 */
	struct sk_buff *           highest_sack;         /*  1800     4 */
	u8                         ecn_flags;            /*  1804     1 */
	__u8                       __cacheline_group_end__tcp_sock_write_tx[0]; /*  1805     0 */
	__u8                       __cacheline_group_begin__tcp_sock_write_txrx[0]; /*  1805     0 */

	/* XXX 3 bytes hole, try to pack */

	__be32                     pred_flags;           /*  1808     4 */

	/* XXX 4 bytes hole, try to pack */

	u64                        tcp_clock_cache;      /*  1816     8 */
	u64                        tcp_mstamp;           /*  1824     8 */
	u32                        rcv_nxt;              /*  1832     4 */
	u32                        snd_nxt;              /*  1836     4 */
	u32                        snd_una;              /*  1840     4 */
	u32                        window_clamp;         /*  1844     4 */
	u32                        srtt_us;              /*  1848     4 */
	u32                        packets_out;          /*  1852     4 */
	/* --- cacheline 29 boundary (1856 bytes) --- */
	u32                        snd_up;               /*  1856     4 */
	u32                        delivered;            /*  1860     4 */
	u32                        delivered_ce;         /*  1864     4 */
	u32                        app_limited;          /*  1868     4 */
	u32                        rcv_wnd;              /*  1872     4 */
	struct tcp_options_received rx_opt;              /*  1876    24 */
	u8                         nonagle:4;            /*  1900: 0  1 */
	u8                         rate_app_limited:1;   /*  1900: 4  1 */

	/* XXX 3 bits hole, try to pack */

	__u8                       __cacheline_group_end__tcp_sock_write_txrx[0]; /*  1901     0 */

	/* XXX 3 bytes hole, try to pack */

	__u8                       __cacheline_group_begin__tcp_sock_write_rx[0] __attribute__((__aligned__(8))); /*  1904     0 */
	u64                        bytes_received;       /*  1904     8 */
	u32                        segs_in;              /*  1912     4 */
	u32                        data_segs_in;         /*  1916     4 */
	/* --- cacheline 30 boundary (1920 bytes) --- */
	u32                        rcv_wup;              /*  1920     4 */
	u32                        max_packets_out;      /*  1924     4 */
	u32                        cwnd_usage_seq;       /*  1928     4 */
	u32                        rate_delivered;       /*  1932     4 */
	u32                        rate_interval_us;     /*  1936     4 */
	u32                        rcv_rtt_last_tsecr;   /*  1940     4 */
	u64                        first_tx_mstamp;      /*  1944     8 */
	u64                        delivered_mstamp;     /*  1952     8 */
	u64                        bytes_acked;          /*  1960     8 */
	struct {
		u32                rtt_us;               /*  1968     4 */
		u32                seq;                  /*  1972     4 */
		u64                time;                 /*  1976     8 */
	} rcv_rtt_est;                                   /*  1968    16 */
	/* --- cacheline 31 boundary (1984 bytes) --- */
	struct {
		u32                space;                /*  1984     4 */
		u32                seq;                  /*  1988     4 */
		u64                time;                 /*  1992     8 */
	} rcvq_space;                                    /*  1984    16 */
	__u8                       __cacheline_group_end__tcp_sock_write_rx[0]; /*  2000     0 */
	u32                        dsack_dups;           /*  2000     4 */
	u32                        compressed_ack_rcv_nxt; /*  2004     4 */
	struct list_head           tsq_node;             /*  2008     8 */
	struct tcp_rack            rack;                 /*  2016    24 */

	/* XXX last struct has 2 bytes of padding */

	u8                         compressed_ack;       /*  2040     1 */
	u8                         dup_ack_counter:2;    /*  2041: 0  1 */
	u8                         tlp_retrans:1;        /*  2041: 2  1 */
	u8                         unused:5;             /*  2041: 3  1 */
	u8                         thin_lto:1;           /*  2042: 0  1 */
	u8                         fastopen_connect:1;   /*  2042: 1  1 */
	u8                         fastopen_no_cookie:1; /*  2042: 2  1 */
	u8                         fastopen_client_fail:2; /*  2042: 3  1 */
	u8                         frto:1;               /*  2042: 5  1 */

	/* XXX 2 bits hole, try to pack */

	u8                         repair_queue;         /*  2043     1 */
	u8                         save_syn:2;           /*  2044: 0  1 */
	u8                         syn_data:1;           /*  2044: 2  1 */
	u8                         syn_fastopen:1;       /*  2044: 3  1 */
	u8                         syn_fastopen_exp:1;   /*  2044: 4  1 */
	u8                         syn_fastopen_ch:1;    /*  2044: 5  1 */
	u8                         syn_data_acked:1;     /*  2044: 6  1 */

	/* XXX 1 bit hole, try to pack */

	u8                         keepalive_probes;     /*  2045     1 */

	/* XXX 2 bytes hole, try to pack */

	/* --- cacheline 32 boundary (2048 bytes) --- */
	u32                        tcp_tx_delay;         /*  2048     4 */
	u32                        mdev_max_us;          /*  2052     4 */
	u32                        reord_seen;           /*  2056     4 */
	u32                        snd_cwnd_cnt;         /*  2060     4 */
	u32                        snd_cwnd_clamp;       /*  2064     4 */
	u32                        snd_cwnd_used;        /*  2068     4 */
	u32                        snd_cwnd_stamp;       /*  2072     4 */
	u32                        prior_cwnd;           /*  2076     4 */
	u32                        prr_delivered;        /*  2080     4 */
	u32                        last_oow_ack_time;    /*  2084     4 */
	struct hrtimer             pacing_timer __attribute__((__aligned__(8))); /*  2088    48 */

	/* XXX last struct has 4 bytes of padding */

	/* --- cacheline 33 boundary (2112 bytes) was 24 bytes ago --- */
	struct hrtimer             compressed_ack_timer __attribute__((__aligned__(8))); /*  2136    48 */

	/* XXX last struct has 4 bytes of padding */

	/* --- cacheline 34 boundary (2176 bytes) was 8 bytes ago --- */
	struct sk_buff *           ooo_last_skb;         /*  2184     4 */
	struct tcp_sack_block      duplicate_sack[1];    /*  2188     8 */
	struct tcp_sack_block      selective_acks[4];    /*  2196    32 */
	struct tcp_sack_block      recv_sack_cache[4];   /*  2228    32 */
	/* --- cacheline 35 boundary (2240 bytes) was 20 bytes ago --- */
	int                        lost_cnt_hint;        /*  2260     4 */
	u32                        prior_ssthresh;       /*  2264     4 */
	u32                        high_seq;             /*  2268     4 */
	u32                        retrans_stamp;        /*  2272     4 */
	u32                        undo_marker;          /*  2276     4 */
	int                        undo_retrans;         /*  2280     4 */

	/* XXX 4 bytes hole, try to pack */

	u64                        bytes_retrans;        /*  2288     8 */
	u32                        total_retrans;        /*  2296     4 */
	u32                        rto_stamp;            /*  2300     4 */
	/* --- cacheline 36 boundary (2304 bytes) --- */
	u16                        total_rto;            /*  2304     2 */
	u16                        total_rto_recoveries; /*  2306     2 */
	u32                        total_rto_time;       /*  2308     4 */
	u32                        urg_seq;              /*  2312     4 */
	unsigned int               keepalive_time;       /*  2316     4 */
	unsigned int               keepalive_intvl;      /*  2320     4 */
	int                        linger2;              /*  2324     4 */
	u8                         bpf_sock_ops_cb_flags; /*  2328     1 */
	u8                         bpf_chg_cc_inprogress:1; /*  2329: 0  1 */

	/* XXX 7 bits hole, try to pack */

	u16                        timeout_rehash;       /*  2330     2 */
	u32                        rcv_ooopack;          /*  2332     4 */
	struct {
		u32                probe_seq_start;      /*  2336     4 */
		u32                probe_seq_end;        /*  2340     4 */
	} mtu_probe;                                     /*  2336     8 */
	u32                        plb_rehash;           /*  2344     4 */
	u32                        mtu_info;             /*  2348     4 */
	struct tcp_fastopen_request * fastopen_req;      /*  2352     4 */
	struct request_sock *      fastopen_rsk;         /*  2356     4 */
	struct saved_syn *         saved_syn;            /*  2360     4 */

	/* size: 2368, cachelines: 37, members: 156 */
	/* sum members: 2304, holes: 7, sum holes: 53 */
	/* sum bitfield members: 34 bits, bit holes: 6, sum bit holes: 22 bits */
	/* padding: 4 */
	/* paddings: 3, sum paddings: 10 */
	/* forced alignments: 5, forced holes: 2, sum forced holes: 38 */
} __attribute__((__aligned__(64)));

It gained 20 bytes in the change. Most notably, it gained a 4 byte hole
between pred_flags and tcp_clock_cache.

I haven't followed the development of these optimizations, and I tried a
few trivial things, some of which didn't work, and some of which did.
Of those that worked, the most notable one was letting the 2 u64 fields,
tcp_clock_cache and tcp_mstamp, be the first members of the group, and
moving the __be32 pred_flags right below them.

Obviously my level of confidence in the fix is quite low, so it would be
great if you could cast an expert eye onto this.
