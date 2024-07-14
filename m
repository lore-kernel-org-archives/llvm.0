Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFF118AED
	for <llvm@lists.linux.dev>; Sun, 14 Jul 2024 20:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720990398; cv=none; b=YTplzuyRku7lw3Kww6cGxPuHhpNAx/tauWnmTY7G4h51QddlOXobfF6xJh0WXFz7lLGcVgiV0DNyFKu95TprJdN+Fz2/fzFS/8/sUIK745HVUvHEsn/05Jn0lUum1GqcngwjAc4+JybTn3h0DK/CWW+CCH95oQGIkvgJfSH8yPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720990398; c=relaxed/simple;
	bh=amvZy6QyHspU9VM28Xcr98VJSJcU+O9BsegQ8f6PtEQ=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=XHrgVcD/++yruWrmN1gETbxhVNrWXVT2LPiYgTVNH/q1yPSBY+/gP7+oHXtfXdaCukbeT4gEQaAYxD7tDhbS4MUzG5n0rY9s9AfZowK0lHGrkbU2Sqn0S5N2uvnyQJo/3j4/mhasclJoml+aDEK6Pvv1nlvFnvWfeo0CPHRbnUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RLyB63ds; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RLyB63ds"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720990395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6o6NAiaui6dPFXpDuCVWegitZ95+pS8c/gfeGZXJqm4=;
	b=RLyB63dsQZK5Kftb5XZZ/N6lBgmXQGFcMBgQHEcYlKKsuy6fogZ809rxH2Wdjei/YoAaFP
	zpGvUki6yPkacGeHoM1haI8Xqm0RGhRiG6tAcOd+2p3C0mE1B8TKpCfqCn1rN3Uootb4no
	oSBhktK6USua+31rfRxc3rN7yCOcJCs=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-230-OEgMiQyfM0yK1Qu1ciPTGg-1; Sun,
 14 Jul 2024 16:53:13 -0400
X-MC-Unique: OEgMiQyfM0yK1Qu1ciPTGg-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 15846196CDF1
	for <llvm@lists.linux.dev>; Sun, 14 Jul 2024 20:53:13 +0000 (UTC)
Received: from [172.64.15.30] (unknown [10.30.34.46])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2D0A31955F3B;
	Sun, 14 Jul 2024 20:53:12 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 12 of 192): Test report for master
 (6.10.0-rc7, mainline.kernel.org-clang, 4d145e3f)
Date: Sun, 14 Jul 2024 20:53:11 -0000
To: bgoncalv@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <10921.124071416531300317@us-mta-230.us.mimecast.lan>
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
    Commit message: Merge tag 'i2c-for-6.10-rc8' of git://git.kernel.org/pu=
b/scm/linux/kernel/git/wsa/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1372702027

One or more kernel tests failed:
    Unrecognized or new issues:
        Reboot test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1372702027-x86_64-kernel_upt_35
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL misc/reboot-test/journalctl-check

    We also see the following known issues which are not related to your ch=
anges:
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1267
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]


Tests that were not ran because of internal issues:=20
    Boot test [s390x]
    CKI/restraint [s390x]
    machineinfo [s390x, x86_64]
    Reboot test [s390x]
    SELinux Custom Module Setup [s390x, x86_64]
    Storage - blktests - blk - upstream [s390x]
    Storage - blktests - nvme-tcp - upstream [s390x]
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

