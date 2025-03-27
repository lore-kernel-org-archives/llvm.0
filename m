Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E4518C345
	for <llvm@lists.linux.dev>; Thu, 27 Mar 2025 02:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743043389; cv=none; b=A9/cJFneoHuWq5PYCllaIbmS93Xo5HBwLCjLvnVYmRm1TtAYhMwZ7+wwEd43Q+m9Lx8ouxzbXhm+sMAkDZFj6H5nhPqJf7/wEm2J96eONKdtGKDmNslqR1claHsUQI9dxfVC5ivesyelteuTMuz8VwV9wVCSwqBTdcnsGZuUSE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743043389; c=relaxed/simple;
	bh=XqrNY//tYCHVjAoVrJs+OIttpDtPJ0vME+FTOFTSDGE=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=ez8h/ckc04W42lkTvOEhxQ499HcDyMggWWUEOvi3ZwA79drbsojp5iEU52LsRjYHoCYk9fWDXvLqUmOLodUJcBZp7iazW3oDeuEmxQzEWN21yN5uBS2h8b82WOnWIyYaVleLtJii31ddhSHYfQ+yQ3zXqQ7af1BjYMEbdTgrKTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c1DzC6eI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c1DzC6eI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743043386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zPLFPZasSh25L4t84oLpnTDzqB3fNAr57chY+VnIoGU=;
	b=c1DzC6eIztirXCotAf3U7Mg/IuvAdg1HyCsiY+bY5ZjW3q4m90geas1zSd5JHY59oOfpBK
	a6O7NCjfCygh5C0MhxFGJwfNdtjOnv191wprh7cVlWH8P3CJlQMdWFc/bBKeALG2GqdKck
	1YYmtm4L66ZLRy4oFArx8cImXeoXXFI=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-324-VWWbICtdP5CehH5zhX-bhA-1; Wed,
 26 Mar 2025 22:43:05 -0400
X-MC-Unique: VWWbICtdP5CehH5zhX-bhA-1
X-Mimecast-MFC-AGG-ID: VWWbICtdP5CehH5zhX-bhA_1743043384
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 03D321809CA5
	for <llvm@lists.linux.dev>; Thu, 27 Mar 2025 02:43:04 +0000 (UTC)
Received: from [172.20.32.163] (unknown [10.30.44.171])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9077319560AD;
	Thu, 27 Mar 2025 02:43:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0,
 upstream-mainline, 1e1ba8d2)
Date: Thu, 27 Mar 2025 02:43:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Message-Id: <14834.125032622430500497@us-mta-324.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WdvYu64q-xL6jOFhFIu5Q0jqRWZu__wvgZeq1kNYupk_1743043384
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'timers-clocksource-2025-03-26' of git://git.=
kernel.org/pub/scm/linux/kernel/git/tip/tip

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1737298896

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1737298896-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1737298896-x86_64-kernel
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

