defmodule Cmd.Help do
  @moduledoc """
  Provides help and usage of the cell tool
  """

  @help """

  cell - discover, update, and debug cellulose cells

  cell list [<cells>]               list found cells (alias for discover for now)
  cell discover [<cells>]           find cells using SSDP on the LAN
  cell watch [<cells>]              watch multicast debug log of one or more cells
  cell provision <cells> <app_id>   provisions a cell to the specified type
  cell provision <cells> <app_id> [--options key=value,key=value]
  cell push <cells> <ware>          push specific firmware to one or more cells
  cell inspect -<cells> [<path>]    inspect a part of the Hub path
  cell normal[ize] [<cells>]        make provisional firmware normal
  cell denormal[ize] <cells>        make normal firmwae provisional
  cell reboot <cells>               reboot a cell
  cell [--help]                     shows this help message


  Options:

    <cells>
          Specifies cell(s) to operate on, in one of the following formats:

          .nnn                    Last octet of the IP on the LAN in decimal

    <ware>
          Specifies the firmware (including path) to install, in one of the
          following formats:

          build/test.fw           Path to firmware in the filesystem

    <path>
          Specifies a path in the Hub tree to view, in the following formats:

          services

          services/firmware

          path/to/somewhere[/...]

    <app_id>
          Specifies the application ID to provision the cell to. Executes the
          method activate/1 found in ~/.cell/provision/<app_id>.ex, written for
          your particular needs. The return of this function is HTTP PUT to the
          device at the location returned by Finder plus /sys/firmware.
          
          The services document located on the cell being provisioned as well
          as any values passed on the command line under --options will be 
          available in ~/.cell/provision/<app_id>.ex in dot seperated format 
          under the key :services. 
          (i.e.: Dict.get(args, :services).root.serial_number)

          The format of the <app_id> is to be one word or words joined by a '_'

          cr1a

          test_cell
    -o, --options
          All options will be passed to local provisioning script. The format shall
          be as follows
          
          hw_ver=1.0,url=some_url_for_some_reason,foo=bar
          
          Each key can be accessed from the dictionary `args` by the value on the
          right of the '=' sign as atoms. So args would be [hw_ver: "1.0", url: 
          "some_url_for_some_reason", foo: "bar"] in this example.
  """

  @doc "Prints out help information using IO.write"
  def run, do: IO.write @help

end
