Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0EF31E893
	for <llvm@lists.linux.dev>; Tue, 16 Sep 2025 19:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758050221; cv=none; b=gf7ankesc63geaGILxAN8721l239cvPY6WU5yLlfeeX9fF8nfKj8FcDpLTrdZJfiKc1e9ioyR87d0KTZ8eq3Ok3EU20wrFBNyTfN+oXBEl7wGR0qkp/M/+zVez/49sV8Nd+o+Spjyi3BWz9dPtZfuwVNWSsgqQAKKrWi/HyxCIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758050221; c=relaxed/simple;
	bh=wQmckZ0wnzQZMJv2mTn2TzfKMMBWRa5TglJUzrgwQqM=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=aOBvdJjfG9pFVhzF4XQWf9rSv9GpkRSO2A7GeEZgMfcJsVEJhUGfBPEo5bkcDFOuUvpOyVdQ/xeweH1PrQj0S8tlJaClTmfFrCw/k3YmKMQu/KJzeYjzxH9uNkCxV67XztHpd47L15m2Qh7BqDogogzBbDqYNTcxRWSJ0nmfpdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R8nLK7CJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R8nLK7CJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758050219;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rRaO3yT9zbpGm2FrL2NkF1lxN6lsjbpGVmHqPXhLa7E=;
	b=R8nLK7CJKHsZPydvKsBxPPXx6XVGZT/XV1NqLpMLU50VssYjbyiQnkl+kE8AkFJKy5qDql
	cBXQjmVYwx55ey1afesD+qsBv7nC4WcdD5XuEkP6Nxr1OYkMx2E8OQAw/XD+fiWi03n1en
	2ycWZ9uwElvehENBT9e41q0kxVbvAOA=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-98-Am0YrZK-P4uO8zxSN4H_sw-1; Tue,
 16 Sep 2025 15:16:57 -0400
X-MC-Unique: Am0YrZK-P4uO8zxSN4H_sw-1
X-Mimecast-MFC-AGG-ID: Am0YrZK-P4uO8zxSN4H_sw_1758050217
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EF88D180048E
	for <llvm@lists.linux.dev>; Tue, 16 Sep 2025 19:16:56 +0000 (UTC)
Received: from [172.20.100.178] (unknown [10.30.44.68])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8980A1800446;
	Tue, 16 Sep 2025 19:16:56 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 31 of 137): Test report for master
 (6.16.0-0, upstream-mainline, c30a1353)
Date: Tue, 16 Sep 2025 19:16:56 -0000
To: yoyang@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <73865.125091615165701491@us-mta-98.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Aj7GmAHFQczmRlm44TZtf5xt13SYTjO1p25kbHdFpJQ_1758050217
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'bpf-fixes' of git://git.kernel.org/pub/scm/l=
inux/kernel/git/bpf/bpf

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1975493431

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - nfsv4.2
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1975493431_x86_64_kernel_kcidb_tool_19330094_10
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/221

    We also see the following known issues which are not related to your ch=
anges:
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://issues.redhat.com/browse/RHELTEST-39
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]
        Issue: [net] [kselftests upstream] catch all failures
            URL: https://issues.redhat.com/browse/RHELTEST-1362
            Affected tests:
                kselftests upstream - bpf [x86_64, x86_64]
                kselftests upstream - bpf_test_progs [x86_64, x86_64]
                kselftests upstream - net [x86_64, x86_64]


Tests that were not ran because of internal issues:
    /distribution/check-install [s390x, x86_64]
    /distribution/command [s390x, x86_64]
    /test/misc/machineinfo [s390x, x86_64]
    Boot test [s390x, x86_64]
    CKI/restraint [s390x, x86_64]
    Reboot test [s390x, x86_64]
    SELinux Custom Module Setup [s390x, x86_64]
    selinux-policy: serge-testsuite [x86_64]
    Storage - blktests - throtl [s390x]
    Storage - blktests - ublk [s390x]
    stress: stress-ng - cpu-cache [s390x]
    stress: stress-ng - memory [s390x]
    xfstests - btrfs [x86_64]
    xfstests - cifsv3.11 [x86_64]
    xfstests - ext4 [x86_64]
    xfstests - nfsv4.2 [x86_64]
    xfstests - xfs [x86_64]


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

