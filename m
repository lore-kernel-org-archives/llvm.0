Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127FF25E81A
	for <llvm@lists.linux.dev>; Wed, 26 Feb 2025 22:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740610332; cv=none; b=KSOw4IyWwerKsWBKv6W2X5PMrY8icLhr/V8L1gLXIP+TA3JsTzxCrnA9yhtCRe1pFDAPa2tmAr48YM3F2P9BGAsZLlvlxaxpWsj5fi0bWkTWJDxv4YT9fd/c9wjLdrIUqdzT/Qti7ju8jPVyHmWREQjFzWvJbi7A5BFBz57eyyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740610332; c=relaxed/simple;
	bh=YdNyKLxglUWW+Rw8B4PKO9cVO5EYZAwVD6RlgmkeNHo=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=ASVDL08SfwczedPxQ4IDHipw8RIkN63WjyaHDXmTuOMIfmUN3WxY8kIAjHIo5bFQfIUYGZf9JHtj2reWUkCl/3qjsf0jcLugWHVAXATglZ8iucybfLSaM0e49W+X97L0SeY8Mxc3MXm5CdHua8pQ0Ns535vjMKm+Lh/prT7pPgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iSK2/Q/C; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iSK2/Q/C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740610329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+fVV/ZMjsg20eK/wa5rg19e0yAz/zRtF53o9f4qr2E4=;
	b=iSK2/Q/Cll5Iv8JilOIa8a5GfGg9JV98VmrqrliPuFMVWrqxaj5STbnDjD9vsO6Biny2QN
	0RTO7PdhDlJocAr148tq+tcklKfFzw8A228WrLYXJ+uBCl2SIJquwibJzPT6XI5iUWok5A
	PysW5AdaRmidwtTXJv3BYlE1vmxAIA8=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-153-UCkQd1eEP8SxDT3gK9Tifg-1; Wed,
 26 Feb 2025 17:52:06 -0500
X-MC-Unique: UCkQd1eEP8SxDT3gK9Tifg-1
X-Mimecast-MFC-AGG-ID: UCkQd1eEP8SxDT3gK9Tifg_1740610325
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1708418EB2CB
	for <llvm@lists.linux.dev>; Wed, 26 Feb 2025 22:52:05 +0000 (UTC)
Received: from [172.64.13.23] (unknown [10.30.32.164])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9B982180087F;
	Wed, 26 Feb 2025 22:52:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0-rc4,
 upstream-mainline, 5394eea1)
Date: Wed, 26 Feb 2025 22:52:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <21964.125022617520600877@us-mta-153.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: deWABTP9VlpOYTmOWT-r8et9jYBYrxNd06yLMlKySGY_1740610325
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'nfs-for-6.14-2' of git://git.linux-nfs.org/p=
rojects/anna/linux-nfs

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1690478577

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1690478577-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1690478577-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1690478577-x86_64-kernel
                   Issue: Kernel build: arch/x86/tools/insn_decoder_test: e=
rror: malformed line
                          https://github.com/Rust-for-Linux/linux/issues/11=
34


If you find a failure unrelated to your changes, please ask the test mainta=
iner to review it.
This will prevent the failures from being incorrectly reported in the futur=
e.

Please reply to this email if you have any questions about the tests that w=
e
ran or if you have any suggestions on how to make future tests more effecti=
ve.

        ,-.   ,-.
       ( C ) ( K )  Continuous
        `-',-.`-'   Kernel
          ( I )     Integration
           `-'
___________________________________________________________________________=
___

