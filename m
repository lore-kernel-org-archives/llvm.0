Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914E43C3C14
	for <llvm@lists.linux.dev>; Fri,  7 Aug 2026 23:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786145537; cv=none; b=e+t5KVWrQ+YFjUhHCHbxleZuVKLqEGesuXEAMkHJskZzPV1hNon1DAEKjuvvkVBTLtlSoaqzV4iTIL59v6krpn70+neITTkdY0n1JsKDKkbejxv6WiAGSpGQA3WhzikK47JRkyM/oANrTjsJ5krFT97djAiY4ciymYaYZrOYESk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786145537; c=relaxed/simple;
	bh=l+K+apsAuCcnzaahWfZ79HVQoFKwIzbK/UzUtJip6mU=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=L/lvHijqkrdym68KSqUmOav3KdT4AOOG04Z5QnjXmj/OfolltMjCFNl4EaNCQZuFMdIJTeG5Q46YXJ9UB0LFyl5lKVoXwqMjnFPIpJdu2t1SRK7sQv7wXzpZaUVDWmW5cAxdfzeMrtAcwBiP2gKh4ADCQiW5/d4/dkuyMcnrr/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Gdmk2YQ9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Gdmk2YQ9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786145534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=t/wjCEAjVSsb2g4HI2sL+wH0Ro+/plM57z2NB+VXLIQ=;
	b=Gdmk2YQ95+XLRc8e2IU6MFVGNhM4L4YEE/seqG4CoQrqvxk1o6N+FuF72RogdIZUX/+mDs
	KlO8suZrb4FRQqGi0jTQqdMa27DWKWlsE1JfR8wfVQgWuYJgbQ+T8hHdNK0loaHxh8fpyd
	GnwvzoDHTMWHAf2kFihSdSRhvp75C2k=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-615-3GDNcjWnNfCWMfweqKTXMg-1; Fri,
 07 Aug 2026 19:32:07 -0400
X-MC-Unique: 3GDNcjWnNfCWMfweqKTXMg-1
X-Mimecast-MFC-AGG-ID: 3GDNcjWnNfCWMfweqKTXMg_1786145526
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 46DA31956096
	for <llvm@lists.linux.dev>; Fri,  7 Aug 2026 23:32:06 +0000 (UTC)
Received: from [172.20.35.218] (unknown [10.30.44.80])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DB2CA19560AB;
	Fri,  7 Aug 2026 23:32:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (MISSED 60 of 66): Test report for master
 (7.2.0-rc6, upstream-mainline, 364465ab)
Date: Fri, 07 Aug 2026 23:32:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <14357.126080719320700181@us-mta-615.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: eJShZFILScegAFqLSFT2oy8p6Y04YrqgI7tI0bOaaF0_1786145526
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: PASSED
             Merge: OK
           Compile: OK
              Test: OK

Tested-by: CKI Project <cki-project@redhat.com>

Kernel information:
    Commit message: Merge tag 'v7.2-rc6-smb3-server-fixes' of git://git.sam=
ba.org/ksmbd

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2739356600

Tests that were not ran because of internal issues:
    /distribution/check-install [aarch64, x86_64]
    /distribution/command [aarch64, x86_64]
    /test/misc/machineinfo [aarch64, x86_64]
    Boot test [aarch64, x86_64]
    CKI/restraint [aarch64, x86_64]
    Reboot test [aarch64, x86_64]
    SELinux Custom Module Setup [aarch64, x86_64]
    selinux-policy: serge-testsuite [aarch64, x86_64]
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

