Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D46EC5
	for <llvm@lists.linux.dev>; Wed, 17 Jul 2024 01:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721181147; cv=none; b=c8SPJbjy5niJ88VqCu5ETJsbVP4o6JdHcZ3o5nn4gIARZdAL4Vg33xj7Ie7s0jih/Futd2TXVetOq8KxA8kcQaZFm4MWXSwqwTPuNbM37zXzSpZ+hSP/Eu7PIpeKl5zGp+VsiSxHofvaMUvTzmfx8Z7nZode6YmIaM+62LM9dzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721181147; c=relaxed/simple;
	bh=d0AgppYqDIusAfp8Xl+/lDFb4yZ1HeGdumgsPbXti+c=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=mZugKzMYHBE66NKTZKWLrXjUfUQYSi37S8Edt5zM6eX/75T2n0vDeTXHiyk+qCl/rHq6HLjv8yok9LBN0NPPPFz6xZz2y8SMkwUrP/eoYRkAcDGNv0V1PiNkU3H3GZx7zuk5bZhB9vSdBzz3pz+flk9IlUJXhSZshwlJN3q4avM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F1qMR4QB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F1qMR4QB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721181144;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=V1DchbZAulXOMtbgZS+71D/kqHVJ+A6Xez/32p+SFxA=;
	b=F1qMR4QB72UKyL61fdvM5oOAbr9NgG7T+Dh0X3p1hUvSLSxEZFk6sP23kAzUKgYzItSozx
	0AHwY5nEEjAU+UPbdIDnc1mL2Rzc0dT0anAXkcr5RoWuvVJSndNVAeOuALUVO1vhBbAwOy
	fDsOl6wE2OD2umSwKgyJnw72rmnsHL8=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-160-SVY4nmyTN16NtzLT_mP2jw-1; Tue,
 16 Jul 2024 21:52:22 -0400
X-MC-Unique: SVY4nmyTN16NtzLT_mP2jw-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8DB8719560A1
	for <llvm@lists.linux.dev>; Wed, 17 Jul 2024 01:52:21 +0000 (UTC)
Received: from [172.64.10.23] (unknown [10.30.34.11])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 942643000183;
	Wed, 17 Jul 2024 01:52:20 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 13 of 192): Test report for master
 (6.10.0, mainline.kernel.org-clang, d6797831)
Date: Wed, 17 Jul 2024 01:52:20 -0000
To: bgoncalv@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <74673.124071621522200159@us-mta-160.us.mimecast.lan>
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
    Commit message: Merge tag 'x86_cpu_for_v6.11_rc1' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/tip/tip

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1374983887

One or more kernel tests failed:
    Unrecognized or new issues:
        Reboot test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1374983887-x86_64-kernel_upt_35
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
    machineinfo [s390x]
    Reboot test [s390x]
    SELinux Custom Module Setup [ppc64le, s390x]
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

