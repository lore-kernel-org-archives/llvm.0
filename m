Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7D42054E3
	for <llvm@lists.linux.dev>; Thu, 27 Mar 2025 08:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743063816; cv=none; b=twlj8NLjgPr6fJlkFehaHfU8za1iJM5yx+3bU7Eil1fU3tq7Rx2wcfapRHi4jtciMiYzlYHQFPVRtM3dfLz0998CYDSe/uHb2mpHKPgVLxyogOZ5yH7Y7PSyBx4H56jVGFZ6WlnhB3K3mwjkZq2LzVqSxJ8u/5TSjJIBrtP3ZRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743063816; c=relaxed/simple;
	bh=Kqkf+fwTBplFalrOsCh9daI2K2rXSw/k3EBDbEqYyX8=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=hCdYq6R2x7cGjijHXOIzw5IyiBPG0WTkYZkEudoZfoq9g2If4im8M/Mju65yZfnsBddNKm8f8OmP5WKY88X6nvDYgImkc5KxeyYkFJ/I3hC5TMX7h7gHxhErv0m3+JxPfOiMZgFDdUwVwm91NU29IgMmzk0j7BGEXOfd4tYeJsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DcDi18gv; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DcDi18gv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743063813;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TfGy/yMh0L8/nnDw+Epl1rsE1401JngtacqNk/ble5g=;
	b=DcDi18gvBaCAzjFCQFfj3j31dV2wEraTZ8BKqY0ueqRaX1KaHxP9qcRTT3lCn8MLZoX220
	/EfaMy9ZQ+HAlSqMIHyoqGsL8Rs81KVA25rAJXTtPE2NLMIjV4k22y73nfaZUGOksgE/07
	fuovjwuwtDP89fimX2s5ZVlu7rNWVKM=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-548-K6rWDRDDOmyIWXj68u5mpQ-1; Thu,
 27 Mar 2025 04:23:31 -0400
X-MC-Unique: K6rWDRDDOmyIWXj68u5mpQ-1
X-Mimecast-MFC-AGG-ID: K6rWDRDDOmyIWXj68u5mpQ_1743063810
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 67D05180025F
	for <llvm@lists.linux.dev>; Thu, 27 Mar 2025 08:23:30 +0000 (UTC)
Received: from [172.20.32.163] (unknown [10.30.44.171])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 184971956095;
	Thu, 27 Mar 2025 08:23:28 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0,
 upstream-mainline, 1a9239bb)
Date: Thu, 27 Mar 2025 08:23:28 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <55718.125032704233100460@us-mta-548.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dd3TKIgRj6Woscmn5yjzgyl3mKzDgZNCzy0z-2xapfY_1743063810
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'net-next-6.15' of git://git.kernel.org/pub/s=
cm/linux/kernel/git/netdev/net-next

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1737535874

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1737535874-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1737535874-x86_64-kernel
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

