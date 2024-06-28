Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53C4B645
	for <llvm@lists.linux.dev>; Fri, 28 Jun 2024 14:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719585203; cv=none; b=eQEqGfzjM4NUXU9h/BWwReRM/YjQ897eSX3PqVnzXa10lU/jZAI4h9ByK3wLZABtm90ni7SwDb5V77bmiEvP6I847cAQ454VA9hOI9xIBT5lfpFxifT8gBAdccNw+QmYcRctrDTEVvqDvsSJrz9P2Tys7GMi+PSVvEtao0fDmIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719585203; c=relaxed/simple;
	bh=upz+D2736txbeEIzfzx/mTtVyO8oC170pb4vJdzohyM=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=R9jbB0w1du7G2CFz+7hzp0VgwNorvpu97lYN4N2Al/0Cf/Kq7MlpKqQuYi4mh0pbwLw7mpkNlm0bdZZ59qvN9nKvysOWdn2C/g59LvP71eA7r+xCR3o7qoEdr9cD3kkRrSq4zpSylSAQQ17g67kBDfB4wIvA9/dw1fN1e+Qz2KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HcJ+vyLp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HcJ+vyLp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719585200;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pCdGNgZwAg9HGB2n3RD6x+nvlbD8aBXlSe0zxm2P5PA=;
	b=HcJ+vyLp3N3jEg5HrnTYw3/YgEZAkrZdHBZhvOxfu8RQgtrXpWOsC9OpddBiQEi/8yOOPE
	jhydTxO7jz+hSvAeCblFPO/2uBkMxvO+v4Q0/IzJ4WLeklE+lPPuzau2jBHg6LVb6+u4dr
	0ggp1BV0QJDSQhh44CzFWQXfFxy6s5g=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-482-P79DoZbON56Bd_3OZ5kWPw-1; Fri,
 28 Jun 2024 10:33:19 -0400
X-MC-Unique: P79DoZbON56Bd_3OZ5kWPw-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2C0F01944DC5
	for <llvm@lists.linux.dev>; Fri, 28 Jun 2024 14:33:18 +0000 (UTC)
Received: from [172.64.3.27] (unknown [10.30.33.101])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6671819560A3;
	Fri, 28 Jun 2024 14:33:17 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 11 of 192): Test report for master
 (6.10.0-rc5, mainline.kernel.org-clang, 6d6444ba)
Date: Fri, 28 Jun 2024 14:33:17 -0000
To: bgoncalv@redhat.com, llvm@lists.linux.dev, xzhou@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Message-Id: <36774.124062810331901166@us-mta-482.us.mimecast.lan>
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
    Commit message: Merge tag 's390-6.10-7' of git://git.kernel.org/pub/scm=
/linux/kernel/git/s390/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1351221082

One or more kernel tests failed:
    Unrecognized or new issues:
        Reboot test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1351221082-x86_64-kernel_upt_35
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL misc/reboot-test/journalctl-check
        xfstests - cifsv3.11
              x86_64 (debug)
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1351221082-x86_64-kernel-debug_upt_32
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/221
                       =E2=9D=8C FAIL generic/246
                       =E2=9D=8C FAIL generic/249
                       =E2=9D=8C FAIL generic/310
                       =E2=9D=8C FAIL generic/339
                       =E2=9D=8C FAIL generic/406
                       =E2=9D=8C FAIL generic/412
                       =E2=9D=8C FAIL generic/420
                       =E2=9D=8C FAIL generic/428
                       =E2=9D=8C FAIL generic/433
                       =E2=9D=8C FAIL generic/437
                       =E2=9D=8C FAIL generic/443
                       =E2=9D=8C FAIL generic/446
                       =E2=9D=8C FAIL generic/451
                       =E2=9D=8C FAIL generic/452
                       =E2=9D=8C FAIL generic/460
                       =E2=9D=8C FAIL generic/524
                       =E2=9D=8C FAIL generic/532
                       =E2=9D=8C FAIL generic/567
                       =E2=9D=8C FAIL generic/590
                       =E2=9D=8C FAIL generic/591
                       =E2=9D=8C FAIL generic/609
        xfstests - nfsv4.2
              x86_64 (debug)
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1351221082-x86_64-kernel-debug_upt_31

    We also see the following known issues which are not related to your ch=
anges:
        Issue: [rhel-10] xfstests - cifsv3.11 - generic/207 - error in bloc=
k: expected 4096 bytes, received 0
            URL: https://issues.redhat.com/browse/RHEL-39974
            Affected tests:
                xfstests - cifsv3.11 [x86_64]
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1267
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]


Tests that were not ran because of internal issues:=20
    Boot test [s390x]
    CKI/restraint [s390x]
    machineinfo [s390x]
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

