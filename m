Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4270D82869
	for <llvm@lists.linux.dev>; Wed, 19 Jun 2024 10:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718792002; cv=none; b=M9SABP70nSiAbsmEAyF/9Eagug4z6cCIs2vXyDzHLABge0yqNncH7gYTgk52Zs+wAPlzlsKTzNU89luf1cbu1L4cB4yC20vP3pvZy0qq7JdwJXhKWq74Q15uB5+Upc4ab4yJFwXkhFyBguWTBIor0iLMN1iKZMLmZ4FZYjUBQlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718792002; c=relaxed/simple;
	bh=jf3Hk1Hjqz6K8EaTd6CEVaficEwDopsn1vI60orCF1A=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=C27b6iA8twfseWefiqq6fGCfqbWb1pUNaIuaL/McqZLscDtJ7Y9AkjUmQ1RRXf3IXcldq1O8eutS3Uch2VildNQ/JhxgWXNm0Jh6x3GJOHZKWzjoBsaub46Tp0cnRSCEHLLyvZG/31PfD7fye0HtAX53Q9Yz+TT+Hwmy9e5JU5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=h26vOz/n; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h26vOz/n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718792000;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vstfiDY55xXjBKQk/P9DezhAqthVLjFDZ0GbXKQwNjQ=;
	b=h26vOz/nxkcZVq8CPwNZQTxD/NE0Ycc12dZaI0xJjWR00qvqiqTKXs1BJugEuFLGVqxFkJ
	7CEYcJDwsfqMu2qmTqP1oxbC9BGtPn5vAnG//x3afeOvHAC86mxsIkhL9XPMto3zToFaek
	RDD6Qc/Xb1S9Ia+vx2Wo2HhgvhOFBzg=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-648-PjWz5lV2P3aq-H7sDWaYog-1; Wed,
 19 Jun 2024 06:13:18 -0400
X-MC-Unique: PjWz5lV2P3aq-H7sDWaYog-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 06B5F19560B1
	for <llvm@lists.linux.dev>; Wed, 19 Jun 2024 10:13:18 +0000 (UTC)
Received: from [172.64.3.44] (unknown [10.30.33.101])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 28BBB3000218;
	Wed, 19 Jun 2024 10:13:17 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 12 of 192): Test report for master
 (6.10.0-rc4, mainline.kernel.org-clang, 92e5605a)
Date: Wed, 19 Jun 2024 10:13:16 -0000
To: bgoncalv@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <74116.124061906131900103@us-mta-648.us.mimecast.lan>
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
    Commit message: Merge tag 'linux_kselftest-fixes-6.10-rc5' of git://git=
.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1337937603

One or more kernel tests failed:
    Unrecognized or new issues:
        Reboot test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1337937603-x86_64-kernel_upt_35
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL misc/reboot-test/journalctl-check

    We also see the following known issues which are not related to your ch=
anges:
        Issue: [rhel-10] xfstests - cifsv3.11 - generic/207 - error in bloc=
k: expected 4096 bytes, received 0
            URL: https://issues.redhat.com/browse/RHEL-39974
            Affected tests:
                xfstests - cifsv3.11 [x86_64, x86_64 (debug)]
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

