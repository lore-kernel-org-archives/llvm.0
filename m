Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977EB17C60
	for <llvm@lists.linux.dev>; Wed,  3 Jul 2024 05:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719984207; cv=none; b=GsO/y2Rg/Ggpm110KAQEdyCq0gB3gu6qFzYFtGlSQI1keFx8Ulegpvb+8IJnC04AwgTdw2ZfbfJWMteB27hh9pP1S7SPYk7OWgCFzk0Vv4dDi/l3VIPJllR4srrUcmYROCatC63F0LzWfEKp8NXO+8//sirc5IWoMUoGoF+h+4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719984207; c=relaxed/simple;
	bh=TnOK0u2aVraRJ6tCJoBaI55xgP3ckSBmT8RIwVnR7aU=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=OYdhVb/ercEtjS5UrJ0f79yUEaLS+5LUsQxYR4Yw3W63ZDRv0ansgfOdvwxstriN0K44+HfTo7GMdNDCK+WSW+owcgyoehIht9rYMQh5gKthNWhRb6TB0HAf7sXs8Eq02e8z6wahme0Ld8Qap638DVANbiQ/pqR3LGDp17fnUqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KWfbG0aZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KWfbG0aZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719984203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/GEwi3AT9hKlUGE5Gsgpt4pkgIX+3X6JgudijbIdcPA=;
	b=KWfbG0aZQ0u2GJAkuSSvILzZtNaTnQ1N1bMBOIoTaDhcj0DlgrVG8M4qswM4PyI/H/sYeY
	S2UL+b8DBgLFvV5SkelISqZIsx21nKrQjVa5yCou743osgrari4CoUxDrWBskZsD31/iPq
	nAMReUyvxTi2buGbajTx6RyU/qdCPvI=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-136-XgNNVNOdPNewSsClCTHW_Q-1; Wed,
 03 Jul 2024 01:23:21 -0400
X-MC-Unique: XgNNVNOdPNewSsClCTHW_Q-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D0ACB195395B
	for <llvm@lists.linux.dev>; Wed,  3 Jul 2024 05:23:20 +0000 (UTC)
Received: from [172.64.0.79] (unknown [10.30.33.131])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 33B4A1954200;
	Wed,  3 Jul 2024 05:23:19 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 16 of 192): Test report for master
 (6.10.0-rc6, mainline.kernel.org-clang, 1dfe225e)
Date: Wed, 03 Jul 2024 05:23:18 -0000
To: llvm@lists.linux.dev, bgoncalv@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Message-Id: <28905.124070301232100195@us-mta-136.us.mimecast.lan>
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
    Commit message: Merge tag 'scsi-fixes' of git://git.kernel.org/pub/scm/=
linux/kernel/git/jejb/scsi

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1356862906

One or more kernel tests failed:
    Unrecognized or new issues:
        Reboot test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1356862906-x86_64-kernel_upt_35
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
    machineinfo [ppc64le, s390x]
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

