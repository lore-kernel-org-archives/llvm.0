Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8C0218827
	for <llvm@lists.linux.dev>; Sun, 18 Jan 2026 08:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768723932; cv=none; b=mFrBCdgxITkkY3KgPiCpqSQLp9jvrs/Avam6CVrhMokTiBhEa9mIT+MCNtD+chn/y1gFctMAL99IMrjPnMuRijC0nYtgdsi2RluybL5//iCnavhvMNso0NsEMjQKktk2Ej1omDBgbZ8nlCXuv/1xDICHBt7Kv91Pj6la3RU5sjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768723932; c=relaxed/simple;
	bh=AOgaUo8yvJS3EErIQQ9PvpjA2y66Wve3kwa13O5HBL4=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=Xphw43oRKbdNd3DDqjFnF/i6wuHM1B84Mg0zqlJKWuNntRqZmDqeLcfSnof2/FY+8Wzy2y+c75TEDWDcr4gKsMGDiNo+9XKR5Q5ygYiwbzJwmmrGR1wXS7WJnW9oAlkZUX7BEKi60/0WVSNf4M9bQVInTRsPi4/Vsg2ri4ML6B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iKMB/tql; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iKMB/tql"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768723929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6FzDnachohbtruIcGPvFvMzy+j/G69m5cgD3Qj1/Ab4=;
	b=iKMB/tqlN8qzOPPhyvgoLBnYoIOXlDkXaAcpNjQt1YDmGU0TkVmlxiCSsOzWBgHoLHFjpc
	JlGj2yIZ5PVXm0lYWQcdIEQjWAUizItPutgXs63qi93McxVvelBS/ZEZaMEzu4Jll+YMuz
	OpZKYYcX8T9Xv+41/DF7icQzOgK5NWU=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-62--ocRhnsiNS-ase1-Cns4Zw-1; Sun,
 18 Jan 2026 03:12:08 -0500
X-MC-Unique: -ocRhnsiNS-ase1-Cns4Zw-1
X-Mimecast-MFC-AGG-ID: -ocRhnsiNS-ase1-Cns4Zw_1768723927
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7246E18003FD
	for <llvm@lists.linux.dev>; Sun, 18 Jan 2026 08:12:07 +0000 (UTC)
Received: from [172.20.95.168] (unknown [10.30.44.183])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 102461955F66;
	Sun, 18 Jan 2026 08:12:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 81 of 110): Test report for master
 (6.19.0-rc5, upstream-mainline, e84d9601)
Date: Sun, 18 Jan 2026 08:12:06 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <57906.126011803120800125@us-mta-62.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: At9nPa-fU3k_N4tElvt4jwFmBbO1hgPbe7y4WyHzt1k_1768723927
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'for-6.19-rc5-tag' of git://git.kernel.org/pu=
b/scm/linux/kernel/git/kdave/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2269546618

One or more kernel builds failed:
    Builds that are failing to boot:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:2269546618_x86_64_kernel-debug

Tests that were not ran because of internal issues:
    /distribution/check-install [aarch64, ppc64le, x86_64]
    /distribution/command [aarch64, ppc64le, x86_64]
    /test/misc/machineinfo [aarch64, ppc64le, x86_64]
    Boot test [aarch64, ppc64le, x86_64]
    CKI/restraint [aarch64, ppc64le, x86_64]
    kselftests upstream - bpf [x86_64]
    kselftests upstream - bpf_test_progs [x86_64]
    kselftests upstream - net [x86_64]
    Reboot test [aarch64, ppc64le, x86_64]
    SELinux Custom Module Setup [aarch64, ppc64le, x86_64]
    selinux-policy: serge-testsuite [aarch64, ppc64le, x86_64]
    Storage - blktests - throtl [aarch64, x86_64]
    Storage - blktests - ublk [aarch64, x86_64]
    stress: stress-ng - cpu-cache [aarch64, x86_64]
    stress: stress-ng - memory [aarch64, x86_64]
    xfstests - btrfs [aarch64, x86_64]
    xfstests - cifsv3.11 [x86_64]
    xfstests - ext4 [aarch64, x86_64]
    xfstests - nfsv4.2 [x86_64]
    xfstests - xfs [aarch64, x86_64]


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

