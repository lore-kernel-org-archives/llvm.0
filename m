Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EAC332EAD
	for <llvm@lists.linux.dev>; Tue, 28 Oct 2025 17:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761672740; cv=none; b=UF+H6U11iqucMStPfrVWySCszTFlu/+d5BrAJV1hxdUSOK/EjMjkOMwmy7UFyO9eEMSGJOy9XUOzMcCatCfn6X1ZLPtWE7++y/pIgLFThqTzOAoU5W7aC8uwjADeZuTvSkyaF5QHgCjfIKxK4gZL3DX9FlYCx3Feu9NdqvB8/N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761672740; c=relaxed/simple;
	bh=B4Xkql2gsCY4GvopVUb517qdda6/CYwzNlYzbBosGMc=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=UOn2bKTxniVnZQI3K5/kBGDQZowd2S43w2xdHAKnL6x/5NPmrliQRmNimrp5PbsR1crPV2iTZSMs+P6kjj3U52MJa1c0e/HdBf0ZpKa72clzGwAFXNd2CQThyhzj1TrkfOLTntjxvWZ35XHkeJCi6v9L2RnQGgbjbNZnFrFHcYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U+1FPGXz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U+1FPGXz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761672736;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+v6Oe8H0G8g4+x6stYbq2XrxUkUWYruq0Nh3FrP/SAQ=;
	b=U+1FPGXzgAw1V7tmqmhSyp4zaPkEMa6wubJ1gV4LnH3iKV4cMuGBH5rOoXGP9PcUO3x1vx
	n1m69srDt+tvS7KhEAZmbznQrTtO6RTFZch5AVN4zazjsammgIpW7jnfQW6Widi3rqNpYR
	k4c2MO+Lw0jfGCNcr4+7VRwqHrlsArk=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-170-ZLCicRgMMFWgJO6ECDdaUw-1; Tue,
 28 Oct 2025 13:32:14 -0400
X-MC-Unique: ZLCicRgMMFWgJO6ECDdaUw-1
X-Mimecast-MFC-AGG-ID: ZLCicRgMMFWgJO6ECDdaUw_1761672733
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5B9691956096
	for <llvm@lists.linux.dev>; Tue, 28 Oct 2025 17:32:13 +0000 (UTC)
Received: from [172.20.102.247] (unknown [10.30.45.77])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CF88030001A2;
	Tue, 28 Oct 2025 17:32:12 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.18.0-rc3,
 upstream-mainline, fd575722)
Date: Tue, 28 Oct 2025 17:32:12 -0000
To: llvm@lists.linux.dev, yoyang@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <04346.125102813321401147@us-mta-170.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hI6hRSMRcP__BGNCdfCj5d6yPjEBDS4hfyR6nM4tmok_1761672733
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'sched_ext-for-6.18-rc3-fixes' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/tj/sched_ext

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2123491158

One or more kernel tests failed:
    =E2=9D=97 Regression(s) detected:
         aarch64 - xfstests - ext4
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2123491158_aarch64_kernel_kcidb_tool_19865560_7
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2123491158_aarch64_kernel_kcidb_tool_19865560_7
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2123491158_aarch64_kernel_kcidb_tool_19865560_7
         aarch64 - xfstests - xfs
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2123491158_aarch64_kernel_kcidb_tool_19865560_8
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2123491158_aarch64_kernel_kcidb_tool_19865560_8
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2123491158_aarch64_kernel_kcidb_tool_19865560_8
         aarch64 - xfstests - btrfs
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2123491158_aarch64_kernel_kcidb_tool_19865560_9
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2123491158_aarch64_kernel_kcidb_tool_19865560_9
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2123491158_aarch64_kernel_kcidb_tool_19865560_9
          x86_64 - xfstests - ext4
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2123491158_x86_64_kernel_kcidb_tool_19865553_7
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2123491158_x86_64_kernel_kcidb_tool_19865553_7
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2123491158_x86_64_kernel_kcidb_tool_19865553_7
          x86_64 - xfstests - xfs
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2123491158_x86_64_kernel_kcidb_tool_19865553_8
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2123491158_x86_64_kernel_kcidb_tool_19865553_8
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2123491158_x86_64_kernel_kcidb_tool_19865553_8
          x86_64 - xfstests - btrfs
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2123491158_x86_64_kernel_kcidb_tool_19865553_9
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2123491158_x86_64_kernel_kcidb_tool_19865553_9
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2123491158_x86_64_kernel_kcidb_tool_19865553_9
          x86_64 - xfstests - nfsv4.2
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2123491158_x86_64_kernel_kcidb_tool_19865553_10
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2123491158_x86_64_kernel_kcidb_tool_19865553_10
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2123491158_x86_64_kernel_kcidb_tool_19865553_10
          x86_64 - xfstests - cifsv3.11
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2123491158_x86_64_kernel_kcidb_tool_19865553_11
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2123491158_x86_64_kernel_kcidb_tool_19865553_11
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2123491158_x86_64_kernel_kcidb_tool_19865553_11
          x86_64 - xfstests - ext4
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2123491158_x86_64_kernel-debug_kcidb_tool_19865618_7
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2123491158_x86_64_kernel-debug_kcidb_tool_19865618_7
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2123491158_x86_64_kernel-debug_kcidb_tool_19865618_7
          x86_64 - xfstests - xfs
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2123491158_x86_64_kernel-debug_kcidb_tool_19865618_8
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2123491158_x86_64_kernel-debug_kcidb_tool_19865618_8
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2123491158_x86_64_kernel-debug_kcidb_tool_19865618_8
          x86_64 - xfstests - btrfs
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2123491158_x86_64_kernel-debug_kcidb_tool_19865618_9
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2123491158_x86_64_kernel-debug_kcidb_tool_19865618_9
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2123491158_x86_64_kernel-debug_kcidb_tool_19865618_9
          x86_64 - xfstests - nfsv4.2
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2123491158_x86_64_kernel-debug_kcidb_tool_19865618_10
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2123491158_x86_64_kernel-debug_kcidb_tool_19865618_10
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2123491158_x86_64_kernel-debug_kcidb_tool_19865618_10
          x86_64 - xfstests - cifsv3.11
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2123491158_x86_64_kernel-debug_kcidb_tool_19865618_11
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2123491158_x86_64_kernel-debug_kcidb_tool_19865618_11
                   Issue: xfstests code is not compatible with gcc-15 -std=
=3Dgnu23
                          https://lore.kernel.org/fstests/20250117043709.29=
41857-1-zlang@kernel.org/T/#u
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2123491158_x86_64_kernel-debug_kcidb_tool_19865618_11

    Note: Any of these might not be a regression and/or we might have mista=
kenly thought this issue to be fixed.
          If it is not a regression, please ask the test maintainer to reop=
en the issue and untag the regression from this execution.

    We also see the following known issues which are not related to your ch=
anges:
        Issue: selinux-policy: serge-testsuite: fatal: unable to access 'ht=
tps://src.fedoraproject.org/tests/selinux.git/': The requested URL returned=
 error: 503
            URL: https://datawarehouse.cki-project.org/kcidb/tests/3565986
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]
        Issue: [net] [kselftests upstream] catch all failures
            URL: https://issues.redhat.com/browse/RHELTEST-1362
            Affected tests:
                kselftests upstream - bpf [x86_64, x86_64]
                kselftests upstream - bpf_test_progs [x86_64, x86_64]
                kselftests upstream - net [x86_64, x86_64]
        Issue: [rawhide] avc:  denied  { remove_name } for  pid=3D11534 com=
m=3D"systemd-ssh-iss" name=3D"50-ssh-vsock.issue" dev=3D"tmpfs" ino=3D2323 =
scontext=3Dsystem_u:system_r:systemd_ssh_issue_t:s0 tcontext=3Dsystem_u:obj=
ect_r:var_run_t:s0 tclass=3Ddir permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2391966
            Affected tests:
                Boot test [s390x]
                Reboot test [s390x]



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

