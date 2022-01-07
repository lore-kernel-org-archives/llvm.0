Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410362C9D
	for <llvm@lists.linux.dev>; Fri,  7 Jan 2022 14:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641566162; x=1673102162;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rfwr19Sq/C14BWU2B83Af9rcCR6fwFoFSRDaSM5Sna0=;
  b=Dn1nRWPBRUgslT2Ll80Cxwohuc+6hCgsYb16ssFDqVb9IPR57sGTmx4Y
   5b0htkSXFFxeEOZ6K1YpWM6HpXUFHOxvS1i/g2VV4Il1qFZhQc4PsbdRV
   fm040jMwWH25+NUChWwnDYsma3FTks6/K0rbdtS3ZSkyrhUhof2cnl5B6
   4V9lL6i+Dtird4xLWeM86/kMlDHIRjRVitqt3SC+4RH7+5a0eH/b4bfsp
   fzClaANIr568AqfasFNIWn8T0/DPzLNbLs35zPRLVIClrFskTjsUK+0/a
   FcSHazSFsq0lvKSJqOeHjl4qIVI3wXT1Rcy4uvbPpIE5DACu1oyd4KV8N
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10219"; a="230215948"
X-IronPort-AV: E=Sophos;i="5.88,270,1635231600"; 
   d="scan'208";a="230215948"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2022 06:36:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,270,1635231600"; 
   d="scan'208";a="513813626"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 07 Jan 2022 06:36:00 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n5qLX-000ImO-K2; Fri, 07 Jan 2022 14:35:59 +0000
Date: Fri, 7 Jan 2022 22:35:08 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v2 2/3] cifs: Reverse the way iov_iters are used in
 reading
Message-ID: <202201072209.NObYCbNl-lkp@intel.com>
References: <164150473942.2994594.17245822903445858488.stgit@warthog.procyon.org.uk>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <164150473942.2994594.17245822903445858488.stgit@warthog.procyon.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi David,

I love your patch! Perhaps something to improve:

[auto build test WARNING on next-20220106]
[cannot apply to cifs/for-next linus/master v5.16-rc8 v5.16-rc7 v5.16-rc6 v5.16-rc8]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/David-Howells/cifs-In-progress-conversion-to-use-iov_iters-instead-of-page-lists/20220107-053700
base:    3770333b3f8cb7c9110889853afaa49777c26ea7
config: i386-randconfig-r026-20220107 (https://download.01.org/0day-ci/archive/20220107/202201072209.NObYCbNl-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 32167bfe64a4c5dd4eb3f7a58e24f4cba76f5ac2)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/f6d9da3b96ace245edc0dcdb78607b58edef4dcb
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review David-Howells/cifs-In-progress-conversion-to-use-iov_iters-instead-of-page-lists/20220107-053700
        git checkout f6d9da3b96ace245edc0dcdb78607b58edef4dcb
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/amd/amdgpu/ drivers/gpu/drm/i810/ drivers/i2c/busses/ drivers/pci/endpoint/functions/ fs/cifs/ sound/pci/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/cifs/smb2ops.c:4902:7: warning: variable 'length' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
                   if (rdata->result != 0) {
                       ^~~~~~~~~~~~~~~~~~
   fs/cifs/smb2ops.c:4931:9: note: uninitialized use occurs here
           return length;
                  ^~~~~~
   fs/cifs/smb2ops.c:4902:3: note: remove the 'if' if its condition is always true
                   if (rdata->result != 0) {
                   ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/cifs/smb2ops.c:4801:12: note: initialize the variable 'length' to silence this warning
           int length;
                     ^
                      = 0
   1 warning generated.


vim +4902 fs/cifs/smb2ops.c

c42a6abe3012832 Pavel Shilovsky    2016-11-17  4787  
4326ed2f6a16ae9 Pavel Shilovsky    2016-11-17  4788  static int
4326ed2f6a16ae9 Pavel Shilovsky    2016-11-17  4789  handle_read_data(struct TCP_Server_Info *server, struct mid_q_entry *mid,
4326ed2f6a16ae9 Pavel Shilovsky    2016-11-17  4790  		 char *buf, unsigned int buf_len, struct page **pages,
de9ac0a6e9efdff Rohith Surabattula 2020-10-28  4791  		 unsigned int npages, unsigned int page_data_size,
de9ac0a6e9efdff Rohith Surabattula 2020-10-28  4792  		 bool is_offloaded)
4326ed2f6a16ae9 Pavel Shilovsky    2016-11-17  4793  {
4326ed2f6a16ae9 Pavel Shilovsky    2016-11-17  4794  	unsigned int data_offset;
4326ed2f6a16ae9 Pavel Shilovsky    2016-11-17  4795  	unsigned int data_len;
c42a6abe3012832 Pavel Shilovsky    2016-11-17  4796  	unsigned int cur_off;
c42a6abe3012832 Pavel Shilovsky    2016-11-17  4797  	unsigned int cur_page_idx;
c42a6abe3012832 Pavel Shilovsky    2016-11-17  4798  	unsigned int pad_len;
4326ed2f6a16ae9 Pavel Shilovsky    2016-11-17  4799  	struct cifs_readdata *rdata = mid->callback_data;
0d35e382e4e96a4 Ronnie Sahlberg    2021-11-05  4800  	struct smb2_hdr *shdr = (struct smb2_hdr *)buf;
4326ed2f6a16ae9 Pavel Shilovsky    2016-11-17  4801  	int length;
74dcf418fe34465 Long Li            2017-11-22  4802  	bool use_rdma_mr = false;
4326ed2f6a16ae9 Pavel Shilovsky    2016-11-17  4803  
4326ed2f6a16ae9 Pavel Shilovsky    2016-11-17  4804  	if (shdr->Command != SMB2_READ) {
3175eb9b577e82b Ronnie Sahlberg    2019-09-04  4805  		cifs_server_dbg(VFS, "only big read responses are supported\n");
4326ed2f6a16ae9 Pavel Shilovsky    2016-11-17  4806  		return -ENOTSUPP;
4326ed2f6a16ae9 Pavel Shilovsky    2016-11-17  4807  	}
4326ed2f6a16ae9 Pavel Shilovsky    2016-11-17  4808  
511c54a2f69195b Pavel Shilovsky    2017-07-08  4809  	if (server->ops->is_session_expired &&
511c54a2f69195b Pavel Shilovsky    2017-07-08  4810  	    server->ops->is_session_expired(buf)) {
de9ac0a6e9efdff Rohith Surabattula 2020-10-28  4811  		if (!is_offloaded)
183eea2ee5ba968 Shyam Prasad N     2021-07-19  4812  			cifs_reconnect(server, true);
511c54a2f69195b Pavel Shilovsky    2017-07-08  4813  		return -1;
511c54a2f69195b Pavel Shilovsky    2017-07-08  4814  	}
511c54a2f69195b Pavel Shilovsky    2017-07-08  4815  
4326ed2f6a16ae9 Pavel Shilovsky    2016-11-17  4816  	if (server->ops->is_status_pending &&
66265f134acfb20 Pavel Shilovsky    2019-01-23  4817  			server->ops->is_status_pending(buf, server))
4326ed2f6a16ae9 Pavel Shilovsky    2016-11-17  4818  		return -1;
4326ed2f6a16ae9 Pavel Shilovsky    2016-11-17  4819  
ec678eae746dd25 Pavel Shilovsky    2019-01-18  4820  	/* set up first two iov to get credits */
ec678eae746dd25 Pavel Shilovsky    2019-01-18  4821  	rdata->iov[0].iov_base = buf;
bb1bccb60c2ebd9 Pavel Shilovsky    2019-01-17  4822  	rdata->iov[0].iov_len = 0;
bb1bccb60c2ebd9 Pavel Shilovsky    2019-01-17  4823  	rdata->iov[1].iov_base = buf;
ec678eae746dd25 Pavel Shilovsky    2019-01-18  4824  	rdata->iov[1].iov_len =
bb1bccb60c2ebd9 Pavel Shilovsky    2019-01-17  4825  		min_t(unsigned int, buf_len, server->vals->read_rsp_size);
ec678eae746dd25 Pavel Shilovsky    2019-01-18  4826  	cifs_dbg(FYI, "0: iov_base=%p iov_len=%zu\n",
ec678eae746dd25 Pavel Shilovsky    2019-01-18  4827  		 rdata->iov[0].iov_base, rdata->iov[0].iov_len);
ec678eae746dd25 Pavel Shilovsky    2019-01-18  4828  	cifs_dbg(FYI, "1: iov_base=%p iov_len=%zu\n",
ec678eae746dd25 Pavel Shilovsky    2019-01-18  4829  		 rdata->iov[1].iov_base, rdata->iov[1].iov_len);
ec678eae746dd25 Pavel Shilovsky    2019-01-18  4830  
ec678eae746dd25 Pavel Shilovsky    2019-01-18  4831  	rdata->result = server->ops->map_error(buf, true);
4326ed2f6a16ae9 Pavel Shilovsky    2016-11-17  4832  	if (rdata->result != 0) {
4326ed2f6a16ae9 Pavel Shilovsky    2016-11-17  4833  		cifs_dbg(FYI, "%s: server returned error %d\n",
4326ed2f6a16ae9 Pavel Shilovsky    2016-11-17  4834  			 __func__, rdata->result);
ec678eae746dd25 Pavel Shilovsky    2019-01-18  4835  		/* normal error on read response */
ac873aa3dc21707 Rohith Surabattula 2020-10-29  4836  		if (is_offloaded)
ac873aa3dc21707 Rohith Surabattula 2020-10-29  4837  			mid->mid_state = MID_RESPONSE_RECEIVED;
ac873aa3dc21707 Rohith Surabattula 2020-10-29  4838  		else
ec678eae746dd25 Pavel Shilovsky    2019-01-18  4839  			dequeue_mid(mid, false);
4326ed2f6a16ae9 Pavel Shilovsky    2016-11-17  4840  		return 0;
4326ed2f6a16ae9 Pavel Shilovsky    2016-11-17  4841  	}
4326ed2f6a16ae9 Pavel Shilovsky    2016-11-17  4842  
1fc6ad2f10ad6f5 Ronnie Sahlberg    2018-06-01  4843  	data_offset = server->ops->read_data_offset(buf);
74dcf418fe34465 Long Li            2017-11-22  4844  #ifdef CONFIG_CIFS_SMB_DIRECT
74dcf418fe34465 Long Li            2017-11-22  4845  	use_rdma_mr = rdata->mr;
74dcf418fe34465 Long Li            2017-11-22  4846  #endif
74dcf418fe34465 Long Li            2017-11-22  4847  	data_len = server->ops->read_data_length(buf, use_rdma_mr);
4326ed2f6a16ae9 Pavel Shilovsky    2016-11-17  4848  
4326ed2f6a16ae9 Pavel Shilovsky    2016-11-17  4849  	if (data_offset < server->vals->read_rsp_size) {
4326ed2f6a16ae9 Pavel Shilovsky    2016-11-17  4850  		/*
4326ed2f6a16ae9 Pavel Shilovsky    2016-11-17  4851  		 * win2k8 sometimes sends an offset of 0 when the read
4326ed2f6a16ae9 Pavel Shilovsky    2016-11-17  4852  		 * is beyond the EOF. Treat it as if the data starts just after
4326ed2f6a16ae9 Pavel Shilovsky    2016-11-17  4853  		 * the header.
4326ed2f6a16ae9 Pavel Shilovsky    2016-11-17  4854  		 */
4326ed2f6a16ae9 Pavel Shilovsky    2016-11-17  4855  		cifs_dbg(FYI, "%s: data offset (%u) inside read response header\n",
4326ed2f6a16ae9 Pavel Shilovsky    2016-11-17  4856  			 __func__, data_offset);
4326ed2f6a16ae9 Pavel Shilovsky    2016-11-17  4857  		data_offset = server->vals->read_rsp_size;
4326ed2f6a16ae9 Pavel Shilovsky    2016-11-17  4858  	} else if (data_offset > MAX_CIFS_SMALL_BUFFER_SIZE) {
4326ed2f6a16ae9 Pavel Shilovsky    2016-11-17  4859  		/* data_offset is beyond the end of smallbuf */
4326ed2f6a16ae9 Pavel Shilovsky    2016-11-17  4860  		cifs_dbg(FYI, "%s: data offset (%u) beyond end of smallbuf\n",
4326ed2f6a16ae9 Pavel Shilovsky    2016-11-17  4861  			 __func__, data_offset);
4326ed2f6a16ae9 Pavel Shilovsky    2016-11-17  4862  		rdata->result = -EIO;
ac873aa3dc21707 Rohith Surabattula 2020-10-29  4863  		if (is_offloaded)
ac873aa3dc21707 Rohith Surabattula 2020-10-29  4864  			mid->mid_state = MID_RESPONSE_MALFORMED;
ac873aa3dc21707 Rohith Surabattula 2020-10-29  4865  		else
4326ed2f6a16ae9 Pavel Shilovsky    2016-11-17  4866  			dequeue_mid(mid, rdata->result);
4326ed2f6a16ae9 Pavel Shilovsky    2016-11-17  4867  		return 0;
4326ed2f6a16ae9 Pavel Shilovsky    2016-11-17  4868  	}
4326ed2f6a16ae9 Pavel Shilovsky    2016-11-17  4869  
c42a6abe3012832 Pavel Shilovsky    2016-11-17  4870  	pad_len = data_offset - server->vals->read_rsp_size;
c42a6abe3012832 Pavel Shilovsky    2016-11-17  4871  
4326ed2f6a16ae9 Pavel Shilovsky    2016-11-17  4872  	if (buf_len <= data_offset) {
4326ed2f6a16ae9 Pavel Shilovsky    2016-11-17  4873  		/* read response payload is in pages */
c42a6abe3012832 Pavel Shilovsky    2016-11-17  4874  		cur_page_idx = pad_len / PAGE_SIZE;
c42a6abe3012832 Pavel Shilovsky    2016-11-17  4875  		cur_off = pad_len % PAGE_SIZE;
c42a6abe3012832 Pavel Shilovsky    2016-11-17  4876  
c42a6abe3012832 Pavel Shilovsky    2016-11-17  4877  		if (cur_page_idx != 0) {
c42a6abe3012832 Pavel Shilovsky    2016-11-17  4878  			/* data offset is beyond the 1st page of response */
c42a6abe3012832 Pavel Shilovsky    2016-11-17  4879  			cifs_dbg(FYI, "%s: data offset (%u) beyond 1st page of response\n",
c42a6abe3012832 Pavel Shilovsky    2016-11-17  4880  				 __func__, data_offset);
c42a6abe3012832 Pavel Shilovsky    2016-11-17  4881  			rdata->result = -EIO;
ac873aa3dc21707 Rohith Surabattula 2020-10-29  4882  			if (is_offloaded)
ac873aa3dc21707 Rohith Surabattula 2020-10-29  4883  				mid->mid_state = MID_RESPONSE_MALFORMED;
ac873aa3dc21707 Rohith Surabattula 2020-10-29  4884  			else
c42a6abe3012832 Pavel Shilovsky    2016-11-17  4885  				dequeue_mid(mid, rdata->result);
c42a6abe3012832 Pavel Shilovsky    2016-11-17  4886  			return 0;
c42a6abe3012832 Pavel Shilovsky    2016-11-17  4887  		}
c42a6abe3012832 Pavel Shilovsky    2016-11-17  4888  
c42a6abe3012832 Pavel Shilovsky    2016-11-17  4889  		if (data_len > page_data_size - pad_len) {
c42a6abe3012832 Pavel Shilovsky    2016-11-17  4890  			/* data_len is corrupt -- discard frame */
c42a6abe3012832 Pavel Shilovsky    2016-11-17  4891  			rdata->result = -EIO;
ac873aa3dc21707 Rohith Surabattula 2020-10-29  4892  			if (is_offloaded)
ac873aa3dc21707 Rohith Surabattula 2020-10-29  4893  				mid->mid_state = MID_RESPONSE_MALFORMED;
ac873aa3dc21707 Rohith Surabattula 2020-10-29  4894  			else
c42a6abe3012832 Pavel Shilovsky    2016-11-17  4895  				dequeue_mid(mid, rdata->result);
c42a6abe3012832 Pavel Shilovsky    2016-11-17  4896  			return 0;
c42a6abe3012832 Pavel Shilovsky    2016-11-17  4897  		}
c42a6abe3012832 Pavel Shilovsky    2016-11-17  4898  
f6d9da3b96ace24 David Howells      2022-01-06  4899  		/* Copy the data to the output I/O iterator. */
f6d9da3b96ace24 David Howells      2022-01-06  4900  		rdata->result = cifs_copy_pages_to_iter(pages, npages, page_data_size,
f6d9da3b96ace24 David Howells      2022-01-06  4901  							cur_off, &rdata->iter);
c42a6abe3012832 Pavel Shilovsky    2016-11-17 @4902  		if (rdata->result != 0) {
ac873aa3dc21707 Rohith Surabattula 2020-10-29  4903  			if (is_offloaded)
ac873aa3dc21707 Rohith Surabattula 2020-10-29  4904  				mid->mid_state = MID_RESPONSE_MALFORMED;
ac873aa3dc21707 Rohith Surabattula 2020-10-29  4905  			else
c42a6abe3012832 Pavel Shilovsky    2016-11-17  4906  				dequeue_mid(mid, rdata->result);
c42a6abe3012832 Pavel Shilovsky    2016-11-17  4907  			return 0;
c42a6abe3012832 Pavel Shilovsky    2016-11-17  4908  		}
c42a6abe3012832 Pavel Shilovsky    2016-11-17  4909  
4326ed2f6a16ae9 Pavel Shilovsky    2016-11-17  4910  	} else if (buf_len >= data_offset + data_len) {
4326ed2f6a16ae9 Pavel Shilovsky    2016-11-17  4911  		/* read response payload is in buf */
4326ed2f6a16ae9 Pavel Shilovsky    2016-11-17  4912  		WARN_ONCE(npages > 0, "read data can be either in buf or in pages");
f6d9da3b96ace24 David Howells      2022-01-06  4913  		length = copy_to_iter(buf + data_offset, data_len, &rdata->iter);
f6d9da3b96ace24 David Howells      2022-01-06  4914  		if (length < 0)
f6d9da3b96ace24 David Howells      2022-01-06  4915  			return length;
4326ed2f6a16ae9 Pavel Shilovsky    2016-11-17  4916  	} else {
4326ed2f6a16ae9 Pavel Shilovsky    2016-11-17  4917  		/* read response payload cannot be in both buf and pages */
4326ed2f6a16ae9 Pavel Shilovsky    2016-11-17  4918  		WARN_ONCE(1, "buf can not contain only a part of read data");
4326ed2f6a16ae9 Pavel Shilovsky    2016-11-17  4919  		rdata->result = -EIO;
ac873aa3dc21707 Rohith Surabattula 2020-10-29  4920  		if (is_offloaded)
ac873aa3dc21707 Rohith Surabattula 2020-10-29  4921  			mid->mid_state = MID_RESPONSE_MALFORMED;
ac873aa3dc21707 Rohith Surabattula 2020-10-29  4922  		else
4326ed2f6a16ae9 Pavel Shilovsky    2016-11-17  4923  			dequeue_mid(mid, rdata->result);
4326ed2f6a16ae9 Pavel Shilovsky    2016-11-17  4924  		return 0;
4326ed2f6a16ae9 Pavel Shilovsky    2016-11-17  4925  	}
4326ed2f6a16ae9 Pavel Shilovsky    2016-11-17  4926  
ac873aa3dc21707 Rohith Surabattula 2020-10-29  4927  	if (is_offloaded)
ac873aa3dc21707 Rohith Surabattula 2020-10-29  4928  		mid->mid_state = MID_RESPONSE_RECEIVED;
ac873aa3dc21707 Rohith Surabattula 2020-10-29  4929  	else
4326ed2f6a16ae9 Pavel Shilovsky    2016-11-17  4930  		dequeue_mid(mid, false);
4326ed2f6a16ae9 Pavel Shilovsky    2016-11-17  4931  	return length;
4326ed2f6a16ae9 Pavel Shilovsky    2016-11-17  4932  }
4326ed2f6a16ae9 Pavel Shilovsky    2016-11-17  4933  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
