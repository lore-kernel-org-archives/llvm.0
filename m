Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2CE29B78B
	for <llvm@lists.linux.dev>; Thu, 21 May 2026 06:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779343330; cv=none; b=IXsfq1V9XRNWF2CCO7Hyvs/uukmTMC5H23OkXPVC+zIwduB+JaD3jzX7WmTVh1Q5cGVAMMi6Y07dbkaUcd/5B7mla4vplczL2fllQSCpoQ5pr53ABc3c8z2mWkfxtPptjVsZ0dMKobMGbZSdP0WUMZG309bkktBdcGlf/sJNwio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779343330; c=relaxed/simple;
	bh=+iCkHyLNGtemnKvbTT2Bm2dJrnIl+Ku+jZlWQtCz90M=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=cNSGAQhrpVMGghgEjewLiWDV6VvLBtVYnrFWHcxZT8+1ja4k/eJvssbTmIQZYZgw7SOKZKCCzV1ARfl72ThSrxkDvaLnKoZkrqU9mFN3YBYhRS5rkrB5CNbXMf/D0aQn9ZsbNXIXDjB761zmZP2wLeYgfwW8h3QGwfEIxFdb2JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LjIFiMmg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LjIFiMmg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779343327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uIdDWqoMFtFCXmLnDaJE8xFg1TJuoHV4SMAoOhw3Zk0=;
	b=LjIFiMmgE94znsWwB0+9M93ErTtZBuD6xqWIeWcYhnVkjHPRcw11byAr27lSGXm/6pPAuF
	gQ02O/zYxVeJ2BxLL3wjKs1DKHI9X39fotuTJSeUiNjE7uFQ8ftJQg5MuTXInha8+lJInu
	tmbZ4LvovPLB5HlDJAS5yaaIxcMbD74=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-675-oIgf7cZMP3ainAx6HqTLMw-1; Thu,
 21 May 2026 02:02:05 -0400
X-MC-Unique: oIgf7cZMP3ainAx6HqTLMw-1
X-Mimecast-MFC-AGG-ID: oIgf7cZMP3ainAx6HqTLMw_1779343325
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id ED3E31956096
	for <llvm@lists.linux.dev>; Thu, 21 May 2026 06:02:04 +0000 (UTC)
Received: from [172.20.199.238] (unknown [10.30.44.8])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4AC7B1685;
	Thu, 21 May 2026 06:02:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.1.0-rc4,
 upstream-mainline, df685633)
Date: Thu, 21 May 2026 06:02:04 -0000
To: yoyang@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
Message-Id: <84301.126052102020600286@us-mta-675.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5YnvavEKgNv8zUTiFB01ds7lFgcsxXTt-eMe02DJtL0_1779343325
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'rcu-fixes.v7.1-20260519a' of git://git.kerne=
l.org/pub/scm/linux/kernel/git/rcu/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2541144685

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2541144685_ppc64le_kernel

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - btrfs
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2541144685_aarch64_kernel_kcidb_tool_21323573_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/301

    We also see the following known issues which are not related to your ch=
anges:
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
            Affected tests:
                xfstests - nfsv4.2 [x86_64]
        Issue: avc: denied { create } for comm=3D"rpc.mountd"
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2456368
            Affected tests:
                xfstests - nfsv4.2 [x86_64]



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

