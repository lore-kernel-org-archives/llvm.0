Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81ECE1C5F1B
	for <llvm@lists.linux.dev>; Wed, 22 Jan 2025 23:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737588788; cv=none; b=mcIFef9saqWfTWCCG3eo8sN3d1hT/BYqwNz4U0Ezk9Gc82jh/5HOIQebtrNuxtfNcqYD7rCAFOpa6VdmfZ+7XM4PR6CuwFoBIRQpQEyJl5WQhujj9OzqVN9uw/ugi4XbDRPP4AvrX3gRcaQ5k3MeN5xNQfWDWFykt2VhNosexP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737588788; c=relaxed/simple;
	bh=5t/N3ltZAykI0/Ad1OPJlMIyWMkJkI332hAURMCmchM=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=PHwoNbfGyxh27Yz/PrmU+NkUL4G9k+WDrLO+7uXQa/R1S7N920Kr3OvM5FkhSMRsdd2Y+ZQjNRiJUQdlQtIgU0FdNpkL18IZBNjLBtAWRjCq/vVBwP6ETwKt7A90131a6zK1kYtyWYrx//Ya4LoVIC7O6b68X8BQ07nqzfr2Hh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JmlqSAce; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JmlqSAce"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737588784;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=r7jOrXbJNYcFNfiPPvVz4NqMZkk6+C66uxz3LfiwORo=;
	b=JmlqSAceXzusKrUHZImXBGrgjjiukTzYf86CjVTlg3NjleUl1x/qxTtU1sMhl5MJuVo2T+
	Wsn6Mj4iJyb8ZBUYF+NkHd/i1xwpfYjLU93HeGCLKaR0Tks80blZXrGn82tb99YS/aV8vY
	aJ7ZtwpPT2HjEVLC4PQKTHifaISe5GY=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-131-abISFu0UNs21lzrbEPqeYQ-1; Wed,
 22 Jan 2025 18:33:03 -0500
X-MC-Unique: abISFu0UNs21lzrbEPqeYQ-1
X-Mimecast-MFC-AGG-ID: abISFu0UNs21lzrbEPqeYQ
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5539E19560B4
	for <llvm@lists.linux.dev>; Wed, 22 Jan 2025 23:33:02 +0000 (UTC)
Received: from [172.64.13.55] (unknown [10.30.32.164])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E17B51955F1B;
	Wed, 22 Jan 2025 23:33:01 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.13.0,
 upstream-mainline, 88e969fc)
Date: Wed, 22 Jan 2025 23:33:01 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <82213.125012218330300289@us-mta-131.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _dWDiz9f5Nz0tT5SDtMV3Gl5zEjH_aShQXE-zntQl1g_1737588782
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'input-for-v6.14-rc0' of git://git.kernel.org=
/pub/scm/linux/kernel/git/dtor/input

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1636804850

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1636804850-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1636804850-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1636804850-x86_64-kernel
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

