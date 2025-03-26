Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39C6199BC
	for <llvm@lists.linux.dev>; Wed, 26 Mar 2025 00:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742949732; cv=none; b=mHTW9jqyXcjU4uVVLGyZax7ikvC/A1bD7BREuq+EHOQewtgZ5T6VpiCOeZDw10rjBLpSuYP8huQWsTccSjpltjxqsYNjhe4C9c56nFkKfY63ZZ7iSaD3dv0ec7aoVCGmL9hmPmJFFRN6AIjiFJa+P8oO9lHF4qnP5ILrWd3KvFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742949732; c=relaxed/simple;
	bh=oHC9A4w3WfKKoC4A0njJrxHolPbi0mrc+aT9rH42kBI=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=c4DJk4J5HNxhlkrKmq7jmlYhkrKhm6Z0L2acsRs3AgwK4ZGh1gIx+tA0KlsK1SlZ4tfYpbWIvULP5rykXGLjlJqON3G76Pyrnrllgqe8WhK1vy0FCFPGxGiqWuMXx333/g8BYpHkWRIHDlqKesAHEqV35S+B7aOyEUeqbI+JWJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JKyLNlEh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JKyLNlEh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742949728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eJmKdM0IwmSBHQPVcFE4Rxv48jCpIczZDE978Hf7Pi0=;
	b=JKyLNlEhKx61q/9x4PLqVwGj2oIF+uYOMd238cGDANyNqfunrsLHHxGVhFucq1m/QpJtnx
	DtTjGoHoZW7zKZHxhoV7pVaPBaHOiYVY5qG1P+ak04cpE5hJ/ON+RlZihq4Zz0Eglvc1j1
	VtNJvnie+DRyW2dx13isbric3LOMdhQ=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-3-vZhrf_omOLCLa4KMDBxe8Q-1; Tue,
 25 Mar 2025 20:42:06 -0400
X-MC-Unique: vZhrf_omOLCLa4KMDBxe8Q-1
X-Mimecast-MFC-AGG-ID: vZhrf_omOLCLa4KMDBxe8Q_1742949726
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 11F281809CA5
	for <llvm@lists.linux.dev>; Wed, 26 Mar 2025 00:42:06 +0000 (UTC)
Received: from [172.20.55.199] (unknown [10.30.45.42])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id AFB8B1800944;
	Wed, 26 Mar 2025 00:42:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0,
 upstream-mainline, b3c623b9)
Date: Wed, 26 Mar 2025 00:42:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <43624.125032520420700103@us-mta-3.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ss34fY16wCRnHliV3CjLY8TiE1qJrqrhfbLlzoZt0NA_1742949726
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'thermal-6.15-rc1' of git://git.kernel.org/pu=
b/scm/linux/kernel/git/rafael/linux-pm

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1735213056

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1735213056-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1735213056-x86_64-kernel
                   Issue: Kernel build: arch/x86/tools/insn_decoder_test: e=
rror: malformed line
                          https://github.com/Rust-for-Linux/linux/issues/11=
34


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

