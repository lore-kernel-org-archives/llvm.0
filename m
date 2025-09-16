Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11255BA4A
	for <llvm@lists.linux.dev>; Tue, 16 Sep 2025 19:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758050340; cv=none; b=OQMAFGz829b3iINI1JylWgQyUMZ21GrwdjzT4HJ7CVrYBAyiFXVGovbgGj95m8c0DX+lnxVYl1n9LqgL10pZM36KbMoo8qJnU2wX1LOHSNevMUt7r//ytdhG8fAsFzuM+sJnLihJlK/wCVa3TBu2HkgZQBXufNP3ShQXs/ZNos0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758050340; c=relaxed/simple;
	bh=HWBI/G2GZVvMuHHvb9jP/d382omomNx5HReBmMVCnjY=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=jFBqbRDm/8N3qZos0Kud2tehreFD6gunw86v6L05Z35Vv0jmurHBAzTNunqSsr234XMt3QutIXS2qf3a/C789avwy11zz+fhV1jUK2SF8N7k17HH6y8fQHV7BWY4vuPSBbrkV8cOvjAAMfPXVztWezwh0VYU1NmA8bctyJdN9Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G5IiMg+7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G5IiMg+7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758050338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=y7zQxRSSgBg9a1Uz6pN/I8s6Ln8kifQktqnWwARgYpQ=;
	b=G5IiMg+7MdiWOZoKw5P7PCOYo6wn3eDmwHAImCuloYt67h2EBVU8CktPuzDEshyc0YBgCd
	4KqgDRvwCzDCtPFk3YOTl/JwKHz1qyJSpYI6v23SSiMccX3jfPUUMCo5MKSbiZ7EQogttm
	S2UZcaQPyHsmM1w/jDk0j7uk7nzQWao=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-121-ZLNT7R9qN5WxJhIXjjWbPA-1; Tue,
 16 Sep 2025 15:18:56 -0400
X-MC-Unique: ZLNT7R9qN5WxJhIXjjWbPA-1
X-Mimecast-MFC-AGG-ID: ZLNT7R9qN5WxJhIXjjWbPA_1758050336
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 282F7180028C
	for <llvm@lists.linux.dev>; Tue, 16 Sep 2025 19:18:56 +0000 (UTC)
Received: from [172.20.100.178] (unknown [10.30.44.68])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 75E99300018D;
	Tue, 16 Sep 2025 19:18:55 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 60 of 137): Test report for master
 (6.16.0-0, upstream-mainline, 806381e1)
Date: Tue, 16 Sep 2025 19:18:55 -0000
To: bgoncalv@redhat.com, ftjahjad@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <67278.125091615185603029@us-mta-121.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GjNTjFzFXBjyvkHTtAlhIJeRRUTWvzhUcuEI25we_8k_1758050336
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'powerpc-6.17-2' of git://git.kernel.org/pub/=
scm/linux/kernel/git/powerpc/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1963834484

One or more kernel tests failed:
    Unrecognized or new issues:
        Boot test
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1963834484_aarch64_kernel_kcidb_tool_19282525_6
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL distribution/kpkginstall/journalctl-c=
heck
        Reboot test
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1963834484_aarch64_kernel_kcidb_tool_19282525_10
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL misc/reboot-test/journalctl-check

    We also see the following known issues which are not related to your ch=
anges:
        Issue: [net] [kselftests upstream] catch all failures
            URL: https://issues.redhat.com/browse/RHELTEST-1362
            Affected tests:
                kselftests upstream - bpf [x86_64, x86_64]
                kselftests upstream - bpf_test_progs [x86_64, x86_64]
                kselftests upstream - net [x86_64, x86_64]


Tests that were not ran because of internal issues:
    /distribution/check-install [aarch64, ppc64le, s390x, x86_64]
    /distribution/command [aarch64, ppc64le, s390x, x86_64]
    /test/misc/machineinfo [aarch64, ppc64le, s390x, x86_64]
    Boot test [aarch64, ppc64le, s390x, x86_64]
    CKI/restraint [aarch64, ppc64le, s390x, x86_64]
    Reboot test [aarch64, ppc64le, s390x, x86_64]
    SELinux Custom Module Setup [aarch64, ppc64le, s390x, x86_64]
    selinux-policy: serge-testsuite [aarch64, ppc64le, s390x]
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

