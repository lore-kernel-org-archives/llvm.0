Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D51EBE
	for <llvm@lists.linux.dev>; Tue, 18 Apr 2023 00:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681779170;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vxNMMYZBFaGylaCyhmPo/cDBuISFxEFhh8rFLgcN6xQ=;
	b=CMs+DsXu1J1SfH0gAO/x0u/cMosEjvjbmf2bxGUaBXnur41oruis3i5dTbtRvu7mTYGZ3P
	T9EyXWUbBeKs5KyTVd/fYIh/hiN+XglF7oBjdP6T3rZFHufyCmlT2AgHDrlNuFkO6qH5h2
	wrqKpAuwNViPbzGc/4c+wjDdlvlJCCw=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-y7LXaDL-PtONfs48L64ygg-1; Mon, 17 Apr 2023 20:52:49 -0400
X-MC-Unique: y7LXaDL-PtONfs48L64ygg-1
Received: by mail-pg1-f197.google.com with SMTP id q196-20020a632acd000000b005140cc9e00aso16038754pgq.22
        for <llvm@lists.linux.dev>; Mon, 17 Apr 2023 17:52:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681779168; x=1684371168;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vxNMMYZBFaGylaCyhmPo/cDBuISFxEFhh8rFLgcN6xQ=;
        b=B0M/s5y2WJlHmbRaPSLaDCTwwHTWALKGDMGjs0g6hILfipi97kKdfzuk4C6Fbs5HzS
         OS89L0EZ52iSna8Y5Eu20DuEr/8z9qFaQBIKfE4Ul0FrE9eElJGWeEOHGyzjncgiP4fC
         vbfqEXR0jLIaRruxFPOiQYay3uyMTb6URRzkOimR1N2WAmVmxz+26RjBrI16/R26sXpg
         kjWDzSOGGaqmrsxwLjUHBa34yyRbHVkDprUGU+FwyQX4dJCy10+FVwywCEBjGiqasj5F
         3L6zuh8ip+4sGy0ahR+wAojsZ2VzV7g7X5jecbz8oyorymiE9d2B7Izpj/Vqgb6fKmXQ
         JO+Q==
X-Gm-Message-State: AAQBX9e/1ke84Bk0wrLv/d4o4f1e1G6U7EdnWrcUdImzG43GhPM2B0iB
	tPlr8Az7f+x8e1qF05Obq5Kls+cxeaoj6yuykoNtcv+iCCdeClfkpk/k6m+lBFgz3JYxLWbWaAm
	gAsQm8T4fCwI0rw==
X-Received: by 2002:a05:6a20:be25:b0:d9:6650:ef14 with SMTP id ge37-20020a056a20be2500b000d96650ef14mr15952098pzb.31.1681779168033;
        Mon, 17 Apr 2023 17:52:48 -0700 (PDT)
X-Google-Smtp-Source: AKy350ap8k33HMoluyvRPZLnf8raP2nYht2Qx0IjN+y1Awiiqz0Ps0Yi/7Rdx59GAsjf309cZtGfcQ==
X-Received: by 2002:a05:6a20:be25:b0:d9:6650:ef14 with SMTP id ge37-20020a056a20be2500b000d96650ef14mr15952085pzb.31.1681779167655;
        Mon, 17 Apr 2023 17:52:47 -0700 (PDT)
Received: from [10.72.12.132] ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id w30-20020a63161e000000b00517f165d0a6sm7601420pgl.4.2023.04.17.17.52.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Apr 2023 17:52:47 -0700 (PDT)
Message-ID: <e3bc12ad-4e38-9206-bc75-e394bb2e600c@redhat.com>
Date: Tue, 18 Apr 2023 08:52:42 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [ceph-client:testing 77/77] fs/ceph/mds_client.c:1866:6: warning:
 variable 'iputs' is used uninitialized whenever 'if' condition is false
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 ceph-devel@vger.kernel.org
References: <202304172343.2ToBO5ag-lkp@intel.com>
From: Xiubo Li <xiubli@redhat.com>
In-Reply-To: <202304172343.2ToBO5ag-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 4/17/23 23:49, kernel test robot wrote:
> tree:   https://github.com/ceph/ceph-client.git testing
> head:   3fef7c3fd10c5f078e0f6ec8c683f2d1e14eb05d
> commit: 3fef7c3fd10c5f078e0f6ec8c683f2d1e14eb05d [77/77] ceph: fix potential use-after-free bug when trimming caps
> config: x86_64-randconfig-a011-20230417 (https://download.01.org/0day-ci/archive/20230417/202304172343.2ToBO5ag-lkp@intel.com/config)
> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # https://github.com/ceph/ceph-client/commit/3fef7c3fd10c5f078e0f6ec8c683f2d1e14eb05d
>          git remote add ceph-client https://github.com/ceph/ceph-client.git
>          git fetch --no-tags ceph-client testing
>          git checkout 3fef7c3fd10c5f078e0f6ec8c683f2d1e14eb05d
>          # save the config file
>          mkdir build_dir && cp config build_dir/.config
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/ceph/
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202304172343.2ToBO5ag-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>>> fs/ceph/mds_client.c:1866:6: warning: variable 'iputs' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
>             if (cap) {
>                 ^~~
>     fs/ceph/mds_client.c:1877:9: note: uninitialized use occurs here
>             while (iputs--)
>                    ^~~~~
>     fs/ceph/mds_client.c:1866:2: note: remove the 'if' if its condition is always true
>             if (cap) {
>             ^~~~~~~~~
>     fs/ceph/mds_client.c:1862:11: note: initialize the variable 'iputs' to silence this warning
>             int iputs;
>                      ^
>                       = 0
>>> fs/ceph/mds_client.c:1957:7: warning: variable 'cap' is uninitialized when used here [-Wuninitialized]
>                     if (cap->cap_gen < atomic_read(&cap->session->s_cap_gen)) {
>                         ^~~
>     fs/ceph/mds_client.c:1949:22: note: initialize the variable 'cap' to silence this warning
>             struct ceph_cap *cap;
>                                 ^
>                                  = NULL
>     2 warnings generated.
>
>
> vim +1866 fs/ceph/mds_client.c

Thanks for reporting this.

As Luis mentioned in another thread, I will fix this in the testing branch.

- Xiubo


>
>    1855	
>    1856	static int remove_session_caps_cb(struct inode *inode, struct rb_node *ci_node,
>    1857					  void *arg)
>    1858	{
>    1859		struct ceph_inode_info *ci = ceph_inode(inode);
>    1860		bool invalidate = false;
>    1861		struct ceph_cap *cap;
>    1862		int iputs;
>    1863	
>    1864		spin_lock(&ci->i_ceph_lock);
>    1865		cap = rb_entry(ci_node, struct ceph_cap, ci_node);
>> 1866		if (cap) {
>    1867			dout(" removing cap %p, ci is %p, inode is %p\n",
>    1868			     cap, ci, &ci->netfs.inode);
>    1869	
>    1870			iputs = ceph_purge_inode_cap(inode, cap, &invalidate);
>    1871		}
>    1872		spin_unlock(&ci->i_ceph_lock);
>    1873	
>    1874		wake_up_all(&ci->i_cap_wq);
>    1875		if (invalidate)
>    1876			ceph_queue_invalidate(inode);
>    1877		while (iputs--)
>    1878			iput(inode);
>    1879		return 0;
>    1880	}
>    1881	
>    1882	/*
>    1883	 * caller must hold session s_mutex
>    1884	 */
>    1885	static void remove_session_caps(struct ceph_mds_session *session)
>    1886	{
>    1887		struct ceph_fs_client *fsc = session->s_mdsc->fsc;
>    1888		struct super_block *sb = fsc->sb;
>    1889		LIST_HEAD(dispose);
>    1890	
>    1891		dout("remove_session_caps on %p\n", session);
>    1892		ceph_iterate_session_caps(session, remove_session_caps_cb, fsc);
>    1893	
>    1894		wake_up_all(&fsc->mdsc->cap_flushing_wq);
>    1895	
>    1896		spin_lock(&session->s_cap_lock);
>    1897		if (session->s_nr_caps > 0) {
>    1898			struct inode *inode;
>    1899			struct ceph_cap *cap, *prev = NULL;
>    1900			struct ceph_vino vino;
>    1901			/*
>    1902			 * iterate_session_caps() skips inodes that are being
>    1903			 * deleted, we need to wait until deletions are complete.
>    1904			 * __wait_on_freeing_inode() is designed for the job,
>    1905			 * but it is not exported, so use lookup inode function
>    1906			 * to access it.
>    1907			 */
>    1908			while (!list_empty(&session->s_caps)) {
>    1909				cap = list_entry(session->s_caps.next,
>    1910						 struct ceph_cap, session_caps);
>    1911				if (cap == prev)
>    1912					break;
>    1913				prev = cap;
>    1914				vino = cap->ci->i_vino;
>    1915				spin_unlock(&session->s_cap_lock);
>    1916	
>    1917				inode = ceph_find_inode(sb, vino);
>    1918				iput(inode);
>    1919	
>    1920				spin_lock(&session->s_cap_lock);
>    1921			}
>    1922		}
>    1923	
>    1924		// drop cap expires and unlock s_cap_lock
>    1925		detach_cap_releases(session, &dispose);
>    1926	
>    1927		BUG_ON(session->s_nr_caps > 0);
>    1928		BUG_ON(!list_empty(&session->s_cap_flushing));
>    1929		spin_unlock(&session->s_cap_lock);
>    1930		dispose_cap_releases(session->s_mdsc, &dispose);
>    1931	}
>    1932	
>    1933	enum {
>    1934		RECONNECT,
>    1935		RENEWCAPS,
>    1936		FORCE_RO,
>    1937	};
>    1938	
>    1939	/*
>    1940	 * wake up any threads waiting on this session's caps.  if the cap is
>    1941	 * old (didn't get renewed on the client reconnect), remove it now.
>    1942	 *
>    1943	 * caller must hold s_mutex.
>    1944	 */
>    1945	static int wake_up_session_cb(struct inode *inode, struct rb_node *ci_node, void *arg)
>    1946	{
>    1947		struct ceph_inode_info *ci = ceph_inode(inode);
>    1948		unsigned long ev = (unsigned long)arg;
>    1949		struct ceph_cap *cap;
>    1950	
>    1951		if (ev == RECONNECT) {
>    1952			spin_lock(&ci->i_ceph_lock);
>    1953			ci->i_wanted_max_size = 0;
>    1954			ci->i_requested_max_size = 0;
>    1955			spin_unlock(&ci->i_ceph_lock);
>    1956		} else if (ev == RENEWCAPS) {
>> 1957			if (cap->cap_gen < atomic_read(&cap->session->s_cap_gen)) {
>    1958				/* mds did not re-issue stale cap */
>    1959				spin_lock(&ci->i_ceph_lock);
>    1960				cap = rb_entry(ci_node, struct ceph_cap, ci_node);
>    1961				if (cap)
>    1962					cap->issued = cap->implemented = CEPH_CAP_PIN;
>    1963				spin_unlock(&ci->i_ceph_lock);
>    1964			}
>    1965		} else if (ev == FORCE_RO) {
>    1966		}
>    1967		wake_up_all(&ci->i_cap_wq);
>    1968		return 0;
>    1969	}
>    1970	
>

