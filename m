Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19772F23
	for <llvm@lists.linux.dev>; Thu,  4 Jul 2024 19:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720119802; cv=none; b=u1VnhR2tPKxGK+pCFH4Glf50xSpy3I2Kh9hPDPDL7jYM9fHJvcloPzINLMdElgY7LWOyqV2o1vkSZhPBd9eU52MuWEtmRlnFpjcoSINc4MsnfKjyAEHr2BbM49wUKdoXbQsz//i/bTV25WNCpn0hR+7HplARbksjpDiF8XnlR5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720119802; c=relaxed/simple;
	bh=UF91JoMJcG/eHlxvwkxYg7M/A7/9woQUGNjddZq2GzY=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=GF8TXykmsjVF7Ke7DR+8/7x4U2XOmuXwf3tuJ7N4qyMvIr4+sB2ZujZTrJ4xFaElnl0IsY939YxI2iei7SM161V8qzZPDDENhw7Zo8l2xsngC43IQRd61vX3luNByrF74M8GggMj47cwW4OBFm0GQe4Dwiyk4GMTxH+BBZiisaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=drOXUl0G; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="drOXUl0G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720119799;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7yXMzvsQoNPhcm9ck2kGsvSeBQ0hp0tgu36N7wzArx0=;
	b=drOXUl0Gh9tIS6BhZkz/JjHdX5lBtK0XZyagTkJSy0HkD7iBo1+6871cop3S4dJBxy/LgH
	O79j/p6fRUIZ3pJ8eRUsWrJN//OkWEYWXy+YpG8+Ct2dsbUilyl4qzgi86/jbyN71a2nda
	uOtA7oZdZtzBlV9/2UUtSJTwpy/jlws=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-68-8K4Wi2biOT-XFvca4-CZzw-1; Thu,
 04 Jul 2024 15:03:17 -0400
X-MC-Unique: 8K4Wi2biOT-XFvca4-CZzw-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EE45C1955F42
	for <llvm@lists.linux.dev>; Thu,  4 Jul 2024 19:03:16 +0000 (UTC)
Received: from [172.64.14.54] (unknown [10.30.32.10])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 340301955F40;
	Thu,  4 Jul 2024 19:03:16 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 39 of 192): Test report for master
 (6.10.0-rc6, mainline.kernel.org-clang, 795c58e4)
Date: Thu, 04 Jul 2024 19:03:16 -0000
To: bgoncalv@redhat.com, xzhou@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <97424.124070415031700809@us-mta-68.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'trace-v6.10-rc6' of git://git.kernel.org/pub=
/scm/linux/kernel/git/trace/linux-trace

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1359827698

One or more kernel tests failed:
    Unrecognized or new issues:
        Reboot test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1359827698-x86_64-kernel_upt_35
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL misc/reboot-test/journalctl-check
        xfstests - cifsv3.11
              x86_64 (debug)
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1359827698-x86_64-kernel-debug_upt_32
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/245
        xfstests - nfsv4.2
              x86_64 (debug)
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1359827698-x86_64-kernel-debug_upt_31

    We also see the following known issues which are not related to your ch=
anges:
        Issue: [rawhide] fatal error: openssl/engine.h: No such file or dir=
ectory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1957
            Affected tests:
                Boot test [ppc64le, s390x]


Tests that were not ran because of internal issues:=20
    AMTU (Abstract Machine Test Utility) [ppc64le, s390x]
    Boot test [s390x]
    CKI/restraint [s390x]
    Filesystem - Loopdev Sanity [ppc64le, s390x]
    kdump - crash-file-load [ppc64le, s390x]
    kdump - kexec-file-load [s390x]
    Libkcapi AF_ALG test [ppc64le, s390x]
    machineinfo [s390x]
    Memory function: memfd_create [ppc64le, s390x]
    Networking - Ethernet drivers sanity [ppc64le, s390x]
    Networking cki netfilter test [ppc64le, s390x]
    Networking vnic: ipvlan/basic [ppc64le, s390x]
    POSIX pjd-fstest suites [ppc64le, s390x]
    Reboot test [ppc64le, s390x]
    SELinux Custom Module Setup [s390x]
    selinux-policy: serge-testsuite [ppc64le, s390x]
    Storage - blktests - blk - upstream [s390x]
    Storage - blktests - nvme-tcp - upstream [s390x]
    Storage - dm/common [ppc64le, s390x]
    Storage - swraid scsi_raid [s390x]
    stress: stress-ng - cpu-cache [s390x]
    stress: stress-ng - memory [s390x]


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

